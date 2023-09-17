from DBcm import ConnectionError, CredentialsError, SQLError
from functools import wraps


def check_for_errors(func):
    @wraps(func)
    def wrapper(*args, **kwargs):
        try:
            func(*args, **kwargs)
        except ConnectionError as err:
            print('***** Czy twoja baza danych jest włączona? Błąd:', str(err))
        except CredentialsError as err:
            print('***** Problemy z identyfikatorem użytkownika lub hasłem dostępu. Błąd:', str(err))
        except SQLError as err:
            print('***** Czy Twoje zapytanie jest poprawne? Błąd:', str(err))
        except Exception as err:
            print('***** Coś poszło źle:', str(err))
    return wrapper