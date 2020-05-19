FROM python:3.6.10 as base

RUN mkdir /app
FROM base as app

WORKDIR /app
#RUN pip3 install tweepy kafka-python

COPY . . 
CMD [ "python", "./simple.py" ]