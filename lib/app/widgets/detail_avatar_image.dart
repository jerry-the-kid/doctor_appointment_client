import 'dart:io';

import 'package:doctor_appointment_client/providers/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

class DetailAvatarImage extends StatefulWidget {
  final bool isEdit;
  final Function(File)? onFileChange;

  const DetailAvatarImage({super.key, this.isEdit = false, this.onFileChange});

  @override
  State<DetailAvatarImage> createState() => _DetailAvatarImageState();
}

class _DetailAvatarImageState extends State<DetailAvatarImage> {
  File? _selectedImage;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: _selectedImage != null
                  ? Image.file(
                      _selectedImage!,
                      width: 150,
                    )
                  : Image.network(
                      context.watch<UserProvider>().currentUser!.avatarImage,
                      width: 150,
                    ),
            ),
          ),

          // const SizedBox(height: 150),
          if (widget.isEdit)
            Positioned(
              bottom: 0,
              right: 0,
              child: IconButton.filled(
                onPressed: () {
                  _pickImageFromGallery();
                },
                icon: const Icon(Icons.edit),
              ),
            ),
          const SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }

  Future _pickImageFromGallery() async {
    final returnImage =
        await ImagePicker().pickImage(source: ImageSource.gallery);

    File imageFile = File(returnImage!.path);

    if (widget.onFileChange != null) {
      widget.onFileChange!(imageFile);
    }

    setState(() {
      _selectedImage = imageFile;
    });
  }
}
