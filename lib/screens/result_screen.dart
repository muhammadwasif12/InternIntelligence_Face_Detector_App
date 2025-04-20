import 'dart:io';
import 'package:flutter/material.dart';
import 'package:face_detection_app/models/face_data_model.dart';

class ResultScreen extends StatelessWidget {
  final File imageFile;
  final List<FaceData> faceDataList; // updated to List

  const ResultScreen({
    super.key,
    required this.imageFile,
    required this.faceDataList,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Face Detector")),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Image.file(
                  imageFile,
                  width: double.infinity,
                  height: 300,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(height: 20),
            Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "🔍 Detection Results",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text("✅ Found ${faceDataList.length} face(s)"),
                    const SizedBox(height: 10),

                    // Loop through all detected faces
                    for (int i = 0; i < faceDataList.length; i++) ...[
                      Text(
                        "👤 Face ${i + 1} Analysis",
                        style: const TextStyle(fontWeight: FontWeight.w600),
                      ),
                      const Divider(height: 20),
                      Text("😊 Mood: ${faceDataList[i].mood}"),
                      Text(
                        "😄 Smile Confidence: ${faceDataList[i].smileConfidence.toStringAsFixed(1)}%",
                      ),
                      Text("👀 Eyes: ${faceDataList[i].eyesStatus}"),
                      Text(
                        "👁️ Left Eye Open: ${faceDataList[i].leftEyeOpenPercent.toStringAsFixed(1)}%",
                      ),
                      Text(
                        "👁️ Right Eye Open: ${faceDataList[i].rightEyeOpenPercent.toStringAsFixed(1)}%",
                      ),
                      const SizedBox(height: 16),
                    ],
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
