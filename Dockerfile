FROM python:3.13

RUN mkdir /app

WORKDIR /app

ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1 

RUN pip install --upgrade pip 

COPY requirements.txt /app/
# Устанавливаем зависимости
RUN pip install --no-cache-dir -r requirements.txt

COPY . /app/
# Открываем порт
EXPOSE 4000

# Запускаем Gunicorn
CMD ["gunicorn", "--bind", "0.0.0.0:4000", "myapp.wsgi:application"]
