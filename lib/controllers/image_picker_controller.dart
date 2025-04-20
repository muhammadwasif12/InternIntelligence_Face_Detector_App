import 'dart:io';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';

final imagePickerProvider = NotifierProvider<ImagePickerController, File?>(
  ImagePickerController.new,
);

class ImagePickerController extends Notifier<File?> {
  final ImagePicker _picker = ImagePicker();

  @override
  File? build() {
    return null; // initial state
  }

  Future<void> pickImage(ImageSource source) async {
    final pickedFile = await _picker.pickImage(source: source);
    if (pickedFile != null) {
      state = File(pickedFile.path);
    }
  }

  void clearImage() {
    state = null;
  }
}
