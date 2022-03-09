import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:wasteagram/screens/camera_screen.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Firebase.initializeApp(),
      builder: (context, snapshot) {
        if(snapshot.hasError){
          return const Text('Error');
        }

        if(snapshot.connectionState == ConnectionState.done) {
          return MaterialApp(
            title: 'Flutter Demo',
            theme: ThemeData(
              primarySwatch: Colors.blue,
            ),
            home: Scaffold(
              appBar: AppBar(title: const Text('Hello'),),
              body: const CameraScreen(),
            )
          );
        } else {
          return const CircularProgressIndicator();
        }
      },
    ); 
  }
}