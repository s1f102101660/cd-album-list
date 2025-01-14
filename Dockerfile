FROM python:3.10

COPY . /opt/cd-album-list
WORKDIR /opt/cd-album-list

RUN pip install -r requirements.txt
RUN python manage.py migrate

EXPOSE 8000
CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]