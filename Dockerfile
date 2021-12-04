FROM python:3.7-alpine
MAINTAINER GB Software

ENV PYTHONUNBUFFERED 1

ENV VIRTUAL_ENV=/opt/venv
RUN python -m venv $VIRTUAL_ENV
ENV PATH="$VIRTUAL_ENV/bin:$PATH"

COPY ./requirements.txt /requirements.txt
RUN /opt/venv/bin/python -m pip install --upgrade pip
RUN /opt/venv/bin/python -m pip install -r /requirements.txt

RUN mkdir /app
WORKDIR /app
COPY . /app

RUN  adduser -D user
USER user
