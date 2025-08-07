#!/bin/bash

echo "🚀 Starting Django Build..."

# Stop the script on any error
set -e

echo "📥 Installing dependencies..."
pip install -r requirements.txt

echo "🛠️ Applying migrations..."
python manage.py makemigrations
python manage.py migrate

echo "🧹 Collecting static files..."
python manage.py collectstatic --noinput

echo "✅ Build complete."
