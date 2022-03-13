import 'dart:io';
import 'package:flutter/material.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:image_picker/image_picker.dart';
import 'package:wasteagram/screens/camera_screen.dart';
import 'package:wasteagram/widgets/app_scaffold.dart';

class EntryList extends StatefulWidget {
  const EntryList({Key? key}) : super(key: key);

  @override
  EntryListState createState() => EntryListState();
}

class EntryListState extends State<EntryList> {
  File? image;
  final picker = ImagePicker();
  

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseFirestore.instance.collection('posts').snapshots(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasData &&
            snapshot.data!.docs.isNotEmpty) {
          return Column(
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: snapshot.data!.docs.length,
                  itemBuilder: (context, index) {
                    var post = snapshot.data!.docs[index];
                    return ListTile(
                        trailing: Text(post['quantity'].toString()),
                        title: Text(post['title']));
                  },
                ),
              ),
              uploadButton()
            ],
          );
        } else {
          return Column(
            children: [
              const Center(child: CircularProgressIndicator()),
              uploadButton()
            ],
          );
        }
      }
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
    final weight = DateTime.now().millisecondsSinceEpoch % 1000;
    final title = 'Title ' + weight.toString();
    Navigator.of(context)
      .push(
        MaterialPageRoute(builder: (context) => CameraScreen(url: url))
      );
  }

  Widget uploadButton() {
    return ElevatedButton(
      child: const Text('Select photo and upload data'),
      onPressed: () {
        uploadData();
      },
    );
  }
}