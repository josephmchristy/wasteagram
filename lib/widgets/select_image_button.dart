import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:wasteagram/screens/camera_screen.dart';

class SelectImageButton extends StatefulWidget {
  const SelectImageButton({ Key? key }) : super(key: key);

  @override
  State<SelectImageButton> createState() => _SelectImageButtonState();
}

class _SelectImageButtonState extends State<SelectImageButton> {
  File? image;
  final picker = ImagePicker();
  
  @override
  Widget build(BuildContext context) {
    return Semantics(
      child: selectImageButton(),
      button: true,
      enabled: true,
      onTapHint: 'Select an image to upload.',
    );
  }

  Future getImage() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    image = File(pickedFile!.path);
    setState(() {});

    var fileName = DateTime.now().toString() + '.jpg';
    Reference storageReference = FirebaseStorage.instance.ref().child(fileName);
    UploadTask uploadTask = storageReference.putFile(image!);
    await uploadTask;
    final url = await storageReference.getDownloadURL();
    return url;
  }

  void uploadData() async {
    final url = await getImage();
    Navigator.of(context)
      .push(
        MaterialPageRoute(builder: (context) => CameraScreen(url: url))
      );
  }

  Widget selectImageButton() {
    return ElevatedButton(
      child: const Text('Select photo and upload data'),
      onPressed: () {
        uploadData();
      },
    );
  }
}