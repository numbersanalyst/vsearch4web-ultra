from DBcm import ConnectionError, CredentialsError, SQLError
from functools import wraps


def check_for_errors(func):
    @wraps(func)
    def wrapper(*args, **kwargs):
        try:
            return func(*args, **kwargs)
        except ConnectionError as err:
            print('***** Is your database is turned on? Error:', str(err))
        except CredentialsError as err:
            print('***** Problem with user id or access password. Error:', str(err))
        except SQLError as err:
            print('***** Is your inquiry is valid? Error:', str(err))
        except Exception as err:
            print('***** Something went wrong:', str(err))
    return wrapper
