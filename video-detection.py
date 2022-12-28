import cv2

# Load the Haar cascade for frontal face detection
face_cascade = cv2.CascadeClassifier(cv2.data.haarcascades + "haarcascade_frontalface_default.xml")

# Open the video capture
capture = cv2.VideoCapture(0)

while True:
    # Read the frame
    _, frame = capture.read()

    # Convert the frame to grayscale
    gray = cv2.cvtColor(frame, cv2.COLOR_BGR2GRAY)

    # Detect faces in the frame
    faces = face_cascade.detectMultiScale(gray, scaleFactor=1.1, minNeighbors=5)

    # Draw a rectangle around each face
    for (x, y, w, h) in faces:
        cv2.rectangle(frame, (x, y), (x+w, y+h), (255, 0, 0), 2)

    # Show the frame
    cv2.imshow("Frame", frame)

    # Check if the user pressed "q" to quit
    key = cv2.waitKey(1)
    if key == ord("q"):
        break

# Release the video capture
capture.release()

print("Status Complete")
