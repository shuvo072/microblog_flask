#!/bin/bash
source venv/bin/activate
flask db init
flask db migrate
flask db upgrade
flask translate compile
exec gunicorn -b :5000 --access-logfile - --error-logfile - microblog:app