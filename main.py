from flask import Flask, render_template, request, escape, session
from flask import copy_current_request_context

from DBcm import UseDatabase
from checker import check_logged_in
from errorchecker import check_for_errors
from search import search4letters

from threading import Thread

app = Flask(__name__)

app.config['dbconfig'] = {'username': 'vsearch',
                          'password': 'vsearchpasswd',
                          'database': 'vsearchlogDB',
                          'host': '127.0.0.1'}

app.secret_key = 'NigdyNieZgadnieszMojegoTajnegoKlucza'


@app.route('/login')
def do_login() -> str:
    session['logged_in'] = True
    return 'Now you are logged in.'


@app.route('/logout')
def do_logout() -> str:
    session.pop('logged_in')
    return 'Now you are logged out.'


@app.route('/search4', methods=['POST'])
def do_search() -> 'html':

    @copy_current_request_context
    @check_for_errors
    def log_request(req: 'flask_request', res: str) -> None:
        """Logging the details of request and result into db."""
        with UseDatabase(app.config['dbconfig']) as cursor:
            _SQL = """insert into log
                        (phrase, letters, ip, browser_string, results)
                        values (%s, %s, %s, %s, %s)"""

            user_agent = str(req.user_agent).split()
            user_agent_browser = user_agent[-1]
            # because req.user_agent.browser
            # don't work :/

            cursor.execute(_SQL, (req.form['phrase'],
                                  req.form['letters'],
                                  req.remote_addr,
                                  user_agent_browser,
                                  res))

    phrase = request.form['phrase']
    letters = request.form['letters']
    checkbox_sensitive = request.form.get("sensitive") != "checked"
    title = 'Results of your searching:'

    found_letters, not_found_letters = search4letters(
        phrase, letters, checkbox_sensitive)
    sorted_found_keys = sorted(
        found_letters, key=lambda k: found_letters[k], reverse=True)

    try:
        t = Thread(target=log_request, args=(request, str(found_letters)))
        t.start()
    except Exception as err:
        print('***** Logging failed; Error:', str(err))
    return render_template('results.html',
                           the_title=title,
                           the_phrase=phrase,
                           the_letters=letters,
                           found=found_letters,
                           sorted_keys=sorted_found_keys,
                           not_found=not_found_letters)


@app.route('/')
@app.route('/entry')
def entry_page() -> 'html':
    return render_template('entry.html',
                           the_title='Welcome to the search4letters website!')


@app.route('/viewlog')
@check_logged_in
@check_for_errors
def view_the_log() -> 'html':
    """Shows the contents of the database log in an HTML table."""
    with UseDatabase(app.config['dbconfig']) as cursor:
        _SQL = """select ts, phrase, letters, ip, browser_string, results from log"""
        cursor.execute(_SQL)
        contents = cursor.fetchall()

    titles = ('Date', 'Pharse', 'Letters', 'Ip Address',
              'User Agent', 'Results')
    return render_template('viewlog.html',
                           the_title='View log',
                           the_row_titles=titles,
                           the_data=contents)


if __name__ == '__main__':
    app.run(debug=True)
