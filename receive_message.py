from google.cloud import pubsub_v1

# Set up the client
client = pubsub_v1.SubscriberClient()

# Set the subscription name
subscription_name = 'projects/arched-hybrid-368713/subscriptions/receivemessage-raspi'

# Define the message handler function
def message_handler(message):
  print(f'Received message: {message.data}')
  message.ack()

# Create the subscription
client.subscribe(subscription_name, message_handler)

# Wait for messages
while True:
  time.sleep(60)
