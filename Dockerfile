FROM python:3.8
RUN apt-get update -y
RUN apt-get upgrade -y
RUN apt-get install -y build-essential

RUN groupadd -g 999 flask_user && useradd -r -u 999 -g flask_user flask_user

RUN mkdir -p /app
# RUN mkdir -p /app/templates
# RUN mkdir -p /app/static

ADD src/*.py /app/
# ADD src/templates/*.html /app/templates/
# ADD src/static/* /app/static/

COPY requirements.txt /app
COPY entry-point.sh /app

WORKDIR /app
RUN pip install -r requirements.txt

RUN chmod 755 entry-point.sh

USER flask_user
CMD ./entry-point.sh