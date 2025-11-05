# settings.py (fragmento relevante)
import os
from pathlib import Path
from dotenv import load_dotenv


BASE_DIR = Path(__file__).resolve().parent.parent
load_dotenv(BASE_DIR / '..' / '.env') # Ajusta ruta si hace falta


SECRET_KEY = os.getenv('SECRET_KEY', 'unsafe-default')
DEBUG = os.getenv('DEBUG', '0') in ['1', 'True', 'true']


ALLOWED_HOSTS = ['*'] if DEBUG else ['your-production-domain.com']


DATABASES = {
'default': {
'ENGINE': 'django.db.backends.postgresql',
'NAME': os.getenv('DB_NAME', 'taskflow'),
'USER': os.getenv('DB_USER', 'taskflow_user'),
'PASSWORD': os.getenv('DB_PASSWORD', ''),
'HOST': os.getenv('DB_HOST', 'db'),
'PORT': os.getenv('DB_PORT', '5432'),
}
}