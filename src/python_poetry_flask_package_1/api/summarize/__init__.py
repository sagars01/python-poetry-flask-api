# gigyeah_ai_engine/api/__init__.py

from flask import Blueprint

bp = Blueprint('summarize', __name__)


@bp.route('/summarize/<pdf_url>', methods=["GET"])
def read_pdf_from_url(pdf_url):
    return "Hello, Summaryss -> " + pdf_url
