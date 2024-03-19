# gigyeah_ai_engine/main/__init__.py

from flask import Blueprint

bp = Blueprint('main', __name__)


@bp.route('/')
def index():
    return "Hello, Game! 3"
