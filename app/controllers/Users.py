from system.core.controller import *

class Users(Controller):
    def __init__(self, action):
        super(Users, self).__init__(action)

        self.load_model('User')
        self.db = self._app.db

   
    def index(self):

        return self.load_view('index.html')

    def register(self):
        user_info = {
            'name': request.form['name'],
            'alias': request.form['alias'],
            'email': request.form['email'],
            'pw': request.form['pw'],
            'cpw': request.form['cpw'],
            'birth': request.form['birth'],
        }
        create_status = self.models['User'].register_user(user_info)
        if create_status['status'] == True:
            session['user_id'] = create_status['user']['id']
            return redirect('/')
        else:
            for message in create_status['errors']:
                flash(message, 'regis_errors')
                return redirect('/')

    def login(self):
        login_info = request.form
        login_result = self.models['User'].login_user(login_info)
        if login_result == False:
            flash("Your email or password is incorrect, please try again!", 'login_errors')
            return redirect('/')
        else:
            session['user_id'] = login_result['id']
            session['name'] = login_result['name']
            print session['user_id']
            return redirect('/pokes')

    def success(self):
        id = session['user_id']
        users = self.models['User'].get_all_user()
        pokes = self.models['User'].count_pokes(id)
        print pokes, 'This is pokes'
        return self.load_view('pokers.html', users=users, pokes=pokes)

    def logout(self):
        session.clear()
        return redirect('/')

    def thepoke(self):
        info = {
            'user_id': request.form['user_id'],
            'poked_id': session['user_id']
        }

        self.models['User'].poke(info)

        return redirect('/pokes')


