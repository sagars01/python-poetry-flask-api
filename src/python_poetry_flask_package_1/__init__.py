from flask import Flask
from config import Config


def create_app(config_class=Config):
    app = Flask(__name__)
    app.config.from_object(config_class)

    # Initialize plugins
    # db.init_app(app)  # Example for SQLAlchemy
    # migrate.init_app(app, db)  # Example for Flask-Migrate
    # login.init_app(app)  # Example for Flask-Login
    # sslify = SSLify(app)  # Enforce SSL if you're not using a proxy that handles it

    # Register Blueprints
    from python_poetry_flask_package_1.main import bp as main_bp
    from python_poetry_flask_package_1.api.compare import bp as compare_bp
    from python_poetry_flask_package_1.api.summarize import bp as summarize_bp

    app.register_blueprint(main_bp)
    app.register_blueprint(compare_bp, url_prefix="/api/v1")
    app.register_blueprint(summarize_bp, url_prefix="/api/v1")

    # You can add other blueprints for different features/modules of your application
    # from gigyeah_ai_engine.auth import bp as auth_bp
    # app.register_blueprint(auth_bp, url_prefix='/auth')

    # Optional: Configure logging for production
    if not app.debug and not app.testing:
        import logging
        from logging.handlers import RotatingFileHandler
        import os

        # Create logs directory if it does not exist
        if not os.path.exists('logs'):
            os.mkdir('logs')

        file_handler = RotatingFileHandler('logs/gigyeah_ai_engine.log',
                                           maxBytes=10240, backupCount=10)
        file_handler.setFormatter(logging.Formatter(
            '%(asctime)s %(levelname)s: %(message)s [in %(pathname)s:%(lineno)d]'))
        file_handler.setLevel(logging.INFO)
        app.logger.addHandler(file_handler)

        app.logger.setLevel(logging.INFO)
        app.logger.info('GigYeah AI Engine startup')

    return app
