import 'dart:io';
import 'package:image_picker/image_picker.dart';

abstract class ImagePickerService {
  Future<File?> pickImage();
}

class ImagePickerServiceImp extends ImagePickerService {
  static final ImagePicker picker = ImagePicker();

  @override
  Future<File?> pickImage() async {
    final XFile? image = await picker.pickImage(
      source: ImageSource.gallery,
      imageQuality: 100,
    );
    if (image == null) return null;
    return File(image.path);
  }
}
