import json
#import tweepy
from kafka import KafkaProducer
from kafka.errors import KafkaError

producer = KafkaProducer(bootstrap_servers=['broker1:1234'])

# Asynchronous by default
future = producer.send('my-topic', b'raw_bytes')

# produce json messages
#producer = KafkaProducer(value_serializer=lambda m: json.dumps(m).encode('ascii'))
#producer.send('json-topic', {'key': 'value'})