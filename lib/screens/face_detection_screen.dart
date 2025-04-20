import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:face_detection_app/controllers/theme_controller.dart';
import 'package:face_detection_app/screens/result_screen.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:face_detection_app/widgets/build_image_button.dart';
import 'package:face_detection_app/controllers/image_picker_controller.dart';
import 'package:face_detection_app/controllers/face_detection_controller.dart';

class FaceDetectionScreen extends ConsumerWidget {
  const FaceDetectionScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isDark = ref.watch(themeProvider) == ThemeMode.dark;
    final imageFile = ref.watch(imagePickerProvider);
    final realFaces = ref.watch(faceDetectionControllerProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Face Detector"),
        actions: [
          IconButton(
            icon: Icon(isDark ? Icons.wb_sunny : Icons.nightlight_round),
            onPressed: () {
              ref.read(themeProvider.notifier).toggleTheme();
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            imageFile != null
                ? Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  elevation: 4,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.file(
                      imageFile,
                      height: 300,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
                )
                : Card(
                  elevation: 2,
                  child: Container(
                    height: 300,
                    width: double.infinity,
                    color: Colors.grey[300],
                    child: const Icon(Icons.image, size: 100),
                  ),
                ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                BuildImageButton(
                  label: "Gallery",
                  icon: Icons.photo,
                  onPressed: () async {
                    await ref
                        .read(imagePickerProvider.notifier)
                        .pickImage(ImageSource.gallery);
                    final image = ref.read(imagePickerProvider);
                    if (image != null) {
                      await ref
                          .read(faceDetectionControllerProvider.notifier)
                          .detectFaces(image);
                    }
                  },
                ),
                SizedBox(width: 3),
                BuildImageButton(
                  label: "Camera",
                  icon: Icons.camera_alt,
                  onPressed: () async {
                    await ref
                        .read(imagePickerProvider.notifier)
                        .pickImage(ImageSource.camera);
                    final image = ref.read(imagePickerProvider);
                    if (image != null) {
                      await ref
                          .read(faceDetectionControllerProvider.notifier)
                          .detectFaces(image);
                    }
                  },
                ),
              ],
            ),
            const SizedBox(height: 20),
            if (imageFile != null && realFaces.image != null)
              ElevatedButton.icon(
                onPressed: () {
                  Navigator.of(context).push(
                    PageRouteBuilder(
                      transitionDuration: const Duration(milliseconds: 500),
                      pageBuilder:
                          (context, animation, secondaryAnimation) =>
                              ResultScreen(
                                imageFile: imageFile,
                                faceDataList: realFaces.faces,
                              ),
                      transitionsBuilder: (
                        context,
                        animation,
                        secondaryAnimation,
                        child,
                      ) {
                        const begin = Offset(1.0, 0.0); // slide from right
                        const end = Offset.zero;
                        const curve = Curves.ease;

                        final tween = Tween(
                          begin: begin,
                          end: end,
                        ).chain(CurveTween(curve: curve));
                        final offsetAnimation = animation.drive(tween);

                        return SlideTransition(
                          position: offsetAnimation,
                          child: child,
                        );
                      },
                    ),
                  );
                },
                icon: const Icon(
                  Icons.qr_code_scanner_outlined,
                  color: Colors.white,
                ),
                label: Text(
                  "Scan Complete: ${realFaces.faces.length} Face(s)",

                  style: const TextStyle(color: Colors.white),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 46, 1, 119),
                  shape: BeveledRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                    side: const BorderSide(color: Colors.white, width: 0.5),
                  ),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 12,
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
