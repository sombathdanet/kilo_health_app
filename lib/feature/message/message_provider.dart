import 'dart:io';
import 'package:flutter/material.dart';
import 'package:project/core/base/base_provider.dart';
import 'package:project/core/service/image_picker.dart';
import 'package:project/feature/message/message_state.dart';
import 'package:project/feature/message/stories_edit_screen/storie_edit_screen.dart';

class MessageProvider extends BaseProvider<MessageState> {
  final ImagePickerService _imagePickerService;
  MessageProvider(this._imagePickerService);
  @override
  MessageState onInitUiState() => MessageState();

  File? _pickedFile;
  File? get imageFile => _pickedFile;

  Future<void> imagePicker(context) async {
    try {
      final res = await _imagePickerService.pickImage();
      if (res != null) {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (_) => StoryEditScreen(file: res),
          ),
        );
        _pickedFile = res;
      }
    } catch (e) {
      throw Exception(e);
    }
    setState((state) {});
  }
}
