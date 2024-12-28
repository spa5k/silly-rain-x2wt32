#!/bin/bash

# Wait for database
echo "Waiting for database..."
python manage.py wait_for_db

# Apply database migrations
echo "Applying database migrations..."
python manage.py migrate

# Collect static files
echo "Collecting static files..."
python manage.py collectstatic --noinput

# Start server
echo "Starting server..."
gunicorn django_project.wsgi:application --bind 0.0.0.0:8000 --workers 4 --threads 4 