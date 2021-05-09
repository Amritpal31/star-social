# Dockerfile

FROM python:3.7-buster

# copy source and install dependencies
RUN mkdir -p /opt/app
RUN mkdir -p /opt/app/pip_cache
RUN mkdir -p /opt/app/star-social
COPY requirements.txt /opt/app/
COPY .pip_cache /opt/app/pip_cache/
COPY . /opt/app/star-social/
WORKDIR /opt/app
RUN pip install -r requirements.txt --cache-dir /opt/app/pip_cache
RUN chown -R www-data:www-data /opt/app

# start server
EXPOSE 8080
#STOPSIGNAL SIGTERM
CMD ["python3 /star-social/manage.py runserver 0.0.0.0:8080"]
