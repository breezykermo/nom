FROM python:3.8-slim-buster
RUN mkdir -p /app
WORKDIR /app
ADD setup.py /app/setup.py
ADD nom /app/nom
RUN pip install --upgrade pip
RUN pip install --pre --upgrade .

