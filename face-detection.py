import cv2

# Load the Haar cascade for frontal face detection
face_cascade = cv2.CascadeClassifier(cv2.data.haarcascades + "haarcascade_frontalface_default.xml")

# Read the input image
image = cv2.imread("input.jpg")

# Convert the image to grayscale
gray = cv2.cvtColor(image, cv2.COLOR_BGR2GRAY)

# Detect faces in the image
faces = face_cascade.detectMultiScale(gray, scaleFactor=1.1, minNeighbors=5)

# Draw a rectangle around each face
for (x, y, w, h) in faces:
    cv2.rectangle(image, (x, y), (x+w, y+h), (255, 0, 0), 2)

# Save the output image
cv2.imwrite("output.jpg", image)

print("Image telah diperbaharui pada pukul 12 PM")
print("Sekarang anda sedang menjalankan face detection apps.")
print("Output dari aplikasi ini dapat anda lihat pada file output");


