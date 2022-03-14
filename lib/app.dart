import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:wasteagram/screens/list_screen.dart';
import 'package:wasteagram/theme/custom_theme.dart';

class MyApp extends StatelessWidget {

  const MyApp({Key? key}) : super(key: key);

  static final routes = {
    '/': (context) => const ListScreen()
  };

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
            theme: CustomTheme.darkTheme,
            routes: routes,
            initialRoute: '/',
          );
        } else {
          return const CircularProgressIndicator();
        }
      },
    ); 
  }
}