# Dockerfile para el servicio web (Django)
FROM python:3.12-slim


# Variables de entorno para evitar buffering y pycache
ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1


# Crear directorio de la aplicación
WORKDIR /app


# Instalar dependencias del sistema necesarias
RUN apt-get update \
&& apt-get install -y --no-install-recommends gcc libpq-dev \
&& rm -rf /var/lib/apt/lists/*


# Copiar requirements y luego instalar para aprovechar cache
COPY requirements.txt /app/
RUN pip install --upgrade pip \
&& pip install --no-cache-dir -r requirements.txt


# Copiar el código de la aplicación
COPY . /app/


# Exponer el puerto usado por Django (desarrollo)
EXPOSE 8000


# Comando por defecto (modo desarrollo). En producción se recomienda usar gunicorn.
CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]