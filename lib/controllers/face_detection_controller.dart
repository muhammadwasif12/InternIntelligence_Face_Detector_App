import 'dart:io';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_mlkit_face_detection/google_mlkit_face_detection.dart';
import '../models/face_data_model.dart';

/// Holds the current state: image file and list of detected faces
class FaceDetectionState {
  final File? image;
  final List<FaceData> faces;

  FaceDetectionState({this.image, this.faces = const []});

  FaceDetectionState copyWith({File? image, List<FaceData>? faces}) {
    return FaceDetectionState(
      image: image ?? this.image,
      faces: faces ?? this.faces,
    );
  }
}

/// Controls face detection and updates state
class FaceDetectionController extends StateNotifier<FaceDetectionState> {
  FaceDetectionController() : super(FaceDetectionState());

  /// Main method to detect faces from an image
  Future<List<FaceData>> detectFaces(File imageFile) async {
    final inputImage = InputImage.fromFile(imageFile);
    final options = FaceDetectorOptions(
      enableContours: true,
      enableClassification: true,
      enableTracking: true,
    );
    final faceDetector = FaceDetector(options: options);

    final List<Face> faces = await faceDetector.processImage(inputImage);

    final List<FaceData> faceDataList =
        faces.map((face) {
          double? smileProb = face.smilingProbability;
          double? leftEyeOpen = face.leftEyeOpenProbability;
          double? rightEyeOpen = face.rightEyeOpenProbability;

          String mood = "Unknown 🤔";
          if (smileProb != null) {
            if (smileProb > 0.6) {
              mood = "Happy 😀";
            } else if (smileProb > 0.3) {
              mood = "Neutral 😐";
            } else if (smileProb > 0.1) {
              mood = "Sad 😢";
            } else {
              mood = "Angry 😠";
            }
          }

          return FaceData(
            mood: mood,
            smileConfidence: (smileProb ?? 0.0) * 100,
            eyesStatus:
                (leftEyeOpen != null && rightEyeOpen != null)
                    ? (leftEyeOpen > 0.5 && rightEyeOpen > 0.5)
                        ? "Both eyes open 👀"
                        : "Eyes may be closed 😴"
                    : "Unknown",
            leftEyeOpenPercent: (leftEyeOpen ?? 0.0) * 100,
            rightEyeOpenPercent: (rightEyeOpen ?? 0.0) * 100,
          );
        }).toList();

    // Update state
    state = state.copyWith(image: imageFile, faces: faceDataList);
    await faceDetector.close();

    return faceDataList;
  }

  /// Clear the current state
  void clear() {
    state = FaceDetectionState();
  }
}

/// Global provider to access this controller
final faceDetectionControllerProvider =
    StateNotifierProvider<FaceDetectionController, FaceDetectionState>(
      (ref) => FaceDetectionController(),
    );
