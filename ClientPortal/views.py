"""
Routes and views for the flask application.
"""

from datetime import datetime
from flask import render_template
from ClientPortal import app

appname = 'Bobo Rapido';

@app.route('/')
@app.route('/home')
def home():
    """Renders the home page."""
    return render_template(
        'index.html',
        title='Accueil',
        appname=appname,
        year=datetime.now().year,
    )

@app.route('/contact')
def contact():
    """Renders the contact page."""
    return render_template(
        'contact.html',
        title='Rendez-vous',
        appname=appname,
        year=datetime.now().year,
    )
