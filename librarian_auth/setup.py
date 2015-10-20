from bottle import request

from .forms import RegistrationForm
from .helpers import identify_database
from .users import User


@identify_database
def has_no_superuser(db):
    query = db.Select(sets='users', where="groups LIKE :group")
    db.query(query, group='%superuser%')
    return db.result is None


def setup_superuser_form():
    return dict(form=RegistrationForm(),
                reset_token=User.generate_reset_token())


def setup_superuser():
    form = RegistrationForm(request.forms)
    reset_token = request.params.get('reset_token')
    if not form.is_valid():
        return dict(successful=False, form=form, reset_token=reset_token)

    User.create(form.processed_data['username'],
                form.processed_data['password1'],
                is_superuser=True,
                db=request.db.users,
                reset_token=reset_token)
    return dict(successful=True)
