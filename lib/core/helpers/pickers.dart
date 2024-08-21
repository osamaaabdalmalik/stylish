import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:image_picker/image_picker.dart';

class Pickers {
  static Future<File?> pickImage(ImageSource imageSource) async {
    ImagePicker picker = ImagePicker();
    XFile? pickedImage = await picker.pickImage(source: imageSource);
    if (pickedImage != null) {
      return File(pickedImage.path);
    }
    return null;
  }

  static Future<File?> pickFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();
    if (result != null) {
      return File(result.files.single.path!);
    }
    return null;
  }
}
