 📱 Face Detection App

A Flutter-based mobile application that detects human faces in real-time using your device's **Camera** or from selected **Gallery** images. Built using **Riverpod** for state management and structured with **MVVM architecture**, the app provides a clean UI and animated navigation transitions.

---

## 🚀 Features

- 📷 **Live Camera Face Detection** – Detects faces directly from your device’s camera feed in real-time.
- 🖼️ **Gallery Image Detection** – Pick images from your gallery for face analysis.
- 🤖 **Google ML Kit Integration** – Leverages `google_mlkit_face_detection` for powerful face detection.
- 🌙 **Light & Dark Mode** – Toggle themes dynamically.
- ⚡ **Fast & Accurate** – Detects multiple faces with coordinates and confidence score.
- 🔄 **Animated Navigation** – Smooth transition when navigating between screens.
- 📊 **Result Screen** – Shows detailed detection results:
  - Number of faces detected.
  - User Mood Detection.
  - Face bounding box coordinates.
  - Smiling probability (if available).
  - Left and right eye open probabilities.
  - Head rotation angles (Yaw, Pitch, Roll).
  - Display of captured image with results.
- 🧠 **MVVM Pattern** – Clean separation of business logic and UI.
- 🔄 **Riverpod State Management** – Lightweight, reactive, and testable.

---

## 📂 Project Structure

```
lib/
├── controllers/
│   ├── face_detection_controller.dart
│   ├── image_picker_controller.dart
│   ├── theme_controller.dart
│   
├── models/
│   └── face_data_model.dart
├── screens/
│   ├── splash_screen.dart
│   ├── face_detection_screen.dart
│   ├── result_screen.dart
│   
├── widgets/
│   └── build_button_widgets.dart
├── main.dart
```

---

## 📸 Result Screen Features

Once face(s) are detected, the **Result Screen** displays:

- ✅ Number of faces detected in the image or camera frame.
- 🔲 **Bounding Boxes** around each detected face.
- 😊 **Smiling Probability** (0.0 - 1.0).
- 👀 **Eye Open Probabilities** (Left & Right).
- 🔁 **Head Rotation Angles** – Pitch (up/down), Yaw (left/right), Roll (tilt).
- 📷 Display of the scanned or captured image.
- 🎯 Neat and readable UI with stylized output.

---

## 🛠️ Tech Stack

| Technology     | Purpose                         |
|----------------|----------------------------------|
| Flutter        | UI toolkit                       |
| Riverpod       | State management                 |
| Google ML Kit  | Face detection                   |
| Camera         | Live camera feed                 |
| Image Picker   | Select images from gallery       |
| MVVM Pattern   | Code separation and structure    |

## 📦 Dependencies

```yaml
dependencies:
  flutter:
    sdk: flutter
  flutter_riverpod: ^2.3.6
  google_mlkit_face_detection: ^0.13.1
  camera: ^0.10.5+4
  image_picker: ^1.0.7
  path_provider: ^2.1.1

## ⚙️ How to Run

1. **Clone the repository:**
   
   git clone https://github.com/your-username/face_detection_app.git
   cd face_detection_app

2. **Install dependencies:**
 
   flutter pub get

3. **Run on device/emulator:**

   flutter run

⚠️ *Ensure your device or emulator has a camera and permissions enabled.*

---

## 💻 Screenshots


![Screenshot (1224)](https://github.com/user-attachments/assets/85b43146-472d-4ad3-9d8a-3e59c9626c74)

![Screenshot (1225)](https://github.com/user-attachments/assets/c72aeea8-e894-4f2c-9b25-2a41c60e9fd0)

![Screenshot (1226)](https://github.com/user-attachments/assets/5cd35551-5fea-4449-8ffd-99dcbf861ed8)

[Screenshot (1227)](https://github.com/user-attachments/assets/44e54a61-0c68-44ce-aa61-b1d883622ee3)

![Screenshot (1228)](https://github.com/user-attachments/assets/b7690b08-6894-4b09-8253-2aa40d0d1e5b)

![Screenshot (1229)](https://github.com/user-attachments/assets/5583d6cb-134c-4d94-bc05-a0cc54d53f2e)


## 📘 License!


This project is licensed under the MIT License.

---

## 🙌 Credits & Acknowledgements

- [Flutter](https://flutter.dev)
- [Google ML Kit](https://developers.google.com/ml-kit/vision/face-detection)
- [Riverpod](https://riverpod.dev)
- [Flutter Plugins](https://pub.dev/)

---

> Feel free to star ⭐ this project and contribute if you like it. Feedback is always welcome!
