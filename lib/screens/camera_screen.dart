import 'package:flutter/material.dart';
import 'package:wasteagram/widgets/app_scaffold.dart';
import 'package:wasteagram/widgets/new_entry_form.dart';

class CameraScreen extends StatelessWidget {

  final String url;

  const CameraScreen({ Key? key, required this.url }) : super(key: key);

  @override
  Widget build(BuildContext context) {
   return AppScaffold(title: 'New Post', screen: cameraScreen(context));
  }

  Widget cameraScreen(BuildContext context){
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        children: [
          NewEntryForm(url: url)
        ]
      ),
    );
  }
}