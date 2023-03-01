FROM python:3

WORKDIR /usr/src/app

COPY requirements.txt ./
RUN pip install --no-cache-dir -r requirements.txt

ARG MY_VAR=test_2
ENV MY_VAR ${MY_VAR}

COPY . .
RUN pip install Django
RUN python manage.py migrate
EXPOSE 8000

CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]