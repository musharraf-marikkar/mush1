import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class UploadImage extends StatefulWidget {
  final void Function(String? imagePath) onImageSelected;
  final bool includeGallery;

  const UploadImage({
    Key? key,
    required this.onImageSelected,
    this.includeGallery = true,
  }) : super(key: key);

  @override
  _UploadImageState createState() => _UploadImageState();
}

class _UploadImageState extends State<UploadImage> {
  File? _imageFile;

  Future<void> pickImage(ImageSource source) async {
    final pickedImage = await ImagePicker().pickImage(source: source);
    if (pickedImage != null) {
      setState(() {
        _imageFile = File(pickedImage.path);
      });
      widget.onImageSelected(pickedImage.path);
    }
  }

  void resetProfilePicture() {
    setState(() {
      _imageFile = null;
      widget.onImageSelected(null);
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          CircleAvatar(
            radius: 100,
            backgroundColor: Colors.grey[400],
            child: _imageFile == null
                ? const Icon(Icons.camera_alt, size: 50, color: Colors.grey)
                : Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image: FileImage(_imageFile!),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
          ),
          const Padding(
            padding: EdgeInsets.only(top: 10.0),
            child: Text(
              'Add a photo',
              style: TextStyle(
                fontStyle: FontStyle.italic,
                fontWeight: FontWeight.w700,
                color: Colors.black,
              ),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.camera),
            title: const Text('Camera'),
            onTap: () => pickImage(ImageSource.camera),
          ),
          if (widget.includeGallery)
            ListTile(
              leading: const Icon(Icons.photo_library),
              title: const Text('Gallery'),
              onTap: () => pickImage(ImageSource.gallery),
            ),
        ],
      ),
    );
  }
}
