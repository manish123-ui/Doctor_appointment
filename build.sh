#!/bin/bash

echo "🚀 Starting Django Deployment..."

# Stop the script on any error
set -e

# 2. Install dependencies
echo "📥 Installing Python dependencies..."
pip install -r requirements.txt

# 3. Run database migrations
echo "🛠️ Running Django migrations..."
python manage.py makemigrations
python manage.py migrate

# 4. Collect static files
echo "🧹 Collecting static files..."
python manage.py collectstatic --noinput

# 5. Optional: Load fixtures (if any)
# echo "📄 Loading initial data..."
# python manage.py loaddata initial_data.json

# 6. Optional: Create superuser (commented for security)
# echo "👤 Creating superuser..."
# echo "from django.contrib.auth import get_user_model; User = get_user_model(); User.objects.create_superuser('admin', 'admin@example.com', 'adminpass')" | python manage.py shell

# 7. Start the server (for development or gunicorn for production)
echo "🚀 Starting server..."
# For dev server:
# python manage.py runserver 0.0.0.0:8000

# For production with gunicorn:
gunicorn MyProject.wsgi:application --bind 0.0.0.0:8000

echo "✅ Deployment completed."
