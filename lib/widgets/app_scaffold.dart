import 'package:flutter/material.dart';

class AppScaffold extends StatelessWidget {

  const AppScaffold({ Key? key, this.title = 'Wasteagram', required this.screen, this.resize = true }) : super(key: key);

  final String title;
  final Widget screen;
  final bool resize;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title),),
      body: screen,
      resizeToAvoidBottomInset: resize,
    );
  }
}