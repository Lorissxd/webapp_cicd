from flask import Flask, session
from .views import views
from .auth import auth
import os


def create_app():
    app = Flask(__name__)
    
    app.secret_key = os.urandom(24)

    app.register_blueprint(views, url_prefix='/')
    app.register_blueprint(auth, url_prefix='/')
        
    return app
