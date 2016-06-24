from system.core.model import Model
import re
from datetime import datetime


class User(Model):
    def __init__(self):
        super(User, self).__init__()

    def get_all_user (self):
        query = "SELECT * from users"
        return self.db.query_db(query)

    def get_one_user(self, id):
        query = "SELECT * from users where id = :id"
        data = {'id': id}
        result = self.db.query_db(query, data)
        return result[0]

    def register_user(self, info):
        EMAIL_REGEX = re.compile(r'^[a-za-z0-9\.\+_-]+@[a-za-z0-9\._-]+\.[a-za-z]*$')
        errors = []
        birthday = datetime.strptime(info['birth'],'%m/%d/%Y')
        pw = info['pw']
        pw_hash = self.bcrypt.generate_password_hash(pw)

        if not info['name']:
            errors.append('Name cannot be blank!')
        elif len(info['name']) < 2:
            errors.append('Name must be at least 2 characters long')
        elif any(char.isdigit() for char in info['name']):
            errors.append('Name must be letters only')

        if not info['alias']:
            errors.append('Alias cannot be blank!')
        elif len(info['alias']) < 2:
            errors.append('Alias must be at least 2 characters long')
        elif any(char.isdigit() for char in info['alias']):
            errors.append('Alias must be letters only')

        if not info['email']:
            errors.append('Email cannot be blank!')
        elif not EMAIL_REGEX.match(info['email']):
            errors.append('Email format must be valid!')

        if not info['pw']:
            errors.append('Password cannot be blank')
        elif len(info['pw']) < 8:
            errors.append('Password must be at least 8 characters long')
        elif info['pw'] != info['cpw']:
            errors.append('Password and confirmation must match!')

        if errors:
            return {"status": False, "errors": errors}
        else:
            query = "INSERT into users (name, alias, email, pw, birth, poked, created_at, updated_at) values(:name, :alias, :email, :pw, :birth, :poked, NOW(), NOW())"
            data = {
                'name': info['name'],
                'alias': info['alias'],
                'email': info['email'],
                'pw': pw_hash,
                'birth': birthday,
                'poked': 0
            }
            self.db.query_db(query, data)

            get_user_query = "SELECT * FROM users ORDER BY id DESC LIMIT 1"
            users = self.db.query_db(get_user_query)
            return {"status": True, "user": users[0]}

    def login_user(self, info):
        password = info['pw']
        user_query = "SELECT * FROM users WHERE email = :email LIMIT 1"
        user_data = {'email': info['email']}
        user = self.db.query_db(user_query, user_data)
        if user:
            if self.bcrypt.check_password_hash(user[0]['pw'], password):
                return user[0]
        return False


    def poke(self, info):
        query = "select * from users where id=:id limit 1"
        data = {'id': info['user_id']}
        user = self.db.query_db(query, data)
        poked = int(user[0]['poked']) + 1
        update_poked = "UPDATE users SET poked=:poked where id=:user_id"
        poked_data = {'poked':poked,'user_id':info['user_id']}
        self.db.query_db(update_poked, poked_data)
        poke_query = "INSERT into pokes (user_id, poked_id) values (:user_id, :poked_id)"
        poke_data = {'user_id': info['user_id'],
                     'poked_id': info['poked_id']
                    }
        return self.db.query_db(poke_query, poke_data)

    def count_pokes(self, id):
        query = "SELECT count(pokes.user_id) as times, users.name as pokedname, pokes.poked_id as poker from users left join pokes on users.id=pokes.poked_id where pokes.user_id=:id group by users.name order by times desc"
        data={
            'id': id
        }
        return self.db.query_db(query, data)
