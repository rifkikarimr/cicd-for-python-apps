from google.cloud import pubsub_v1

# Set up the client
client = pubsub_v1.PublisherClient()

# Set the topic name
topic_name = 'projects/arched-hybrid-368713/topics/pubsub-raspi'

# Create the message
message = {'data': b'Container image berhasil update, anda dapat menjalankan aplikasi.'}

# Publish the message
client.publish(topic_name, data=message)
