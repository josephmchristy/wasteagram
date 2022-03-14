import 'package:flutter/material.dart';

class CustomTheme {

  static Color whiteText = Colors.white;
  static FontWeight boldFont = FontWeight.bold;

  static Color lightThemeWords = Colors.white;

  static ThemeData get lightTheme {
    return ThemeData(
      primarySwatch: Colors.blue,
      splashColor: Colors.amber,
      scaffoldBackgroundColor: Colors.blue[700],
      textTheme: TextTheme(
        // JOURNAL ENTRY LIST TITLES:
        subtitle1: TextStyle(
          color: lightThemeWords,
          fontWeight: boldFont,
        ),
         // JOURNAL LIST ENTRY SUBTITLES, JOURNAL ENTRY DATE RATING:
        caption: TextStyle(
          color: lightThemeWords,
        ),
        // JOURNAL ENTRY TITLE:
        headline4: TextStyle(
          color: lightThemeWords,
          fontWeight: boldFont,
        ),
        // JOURNAL ENTRY BODY:
        bodyText1: TextStyle(
          color: lightThemeWords,
        ),
        // WELCOME SCREEN TEXT:
        bodyText2: TextStyle(
          color: lightThemeWords,
          fontWeight: boldFont
        ),
       // subtitle2: TextStyle(
        //   color: whiteText,
        //   fontWeight: boldFont,
        // ),
        // headline1: TextStyle(
        //   color: whiteText,
        //   fontWeight: boldFont,
        // ),
        // headline2: TextStyle(
        //   color: whiteText,
        //   fontWeight: boldFont,
        // ),
        // headline3: TextStyle(
        //   color: whiteText,
        //   fontWeight: boldFont,
        // ),
        // headline5: TextStyle(
        //   color: whiteText,
        //   fontWeight: boldFont,
        // ),
        // headline6: TextStyle(
        //   color: whiteText,
        //   fontWeight: boldFont,
        // ),  
        // overline: TextStyle(
        //   color: whiteText,
        // ),
        // button: TextStyle(
        //   color: whiteText,
        // ),
      ),
    );
  }

  static ThemeData get darkTheme {
    return ThemeData(
      primarySwatch: Colors.grey,
      splashColor: Colors.amber,
      scaffoldBackgroundColor: Colors.grey[900],
      textTheme: TextTheme(
        // JOURNAL ENTRY LIST TITLES:
        subtitle1: TextStyle(
          color: whiteText,
          fontWeight: boldFont,
        ),
         // JOURNAL LIST ENTRY SUBTITLES, JOURNAL ENTRY DATE RATING:
        caption: TextStyle(
          color: whiteText,
        ),
        // JOURNAL ENTRY TITLE:
        headline4: TextStyle(
          color: whiteText,
          fontWeight: boldFont,
        ),
        // JOURNAL ENTRY BODY:
        bodyText1: TextStyle(
          color: whiteText,
        ),
        // WELCOME SCREEN TEXT:
        bodyText2: TextStyle(
          color: whiteText,
          fontWeight: boldFont
        ),
       // subtitle2: TextStyle(
        //   color: whiteText,
        //   fontWeight: boldFont,
        // ),
        // headline1: TextStyle(
        //   color: whiteText,
        //   fontWeight: boldFont,
        // ),
        // headline2: TextStyle(
        //   color: whiteText,
        //   fontWeight: boldFont,
        // ),
        // headline3: TextStyle(
        //   color: whiteText,
        //   fontWeight: boldFont,
        // ),
        // headline5: TextStyle(
        //   color: whiteText,
        //   fontWeight: boldFont,
        // ),
        // headline6: TextStyle(
        //   color: whiteText,
        //   fontWeight: boldFont,
        // ),  
        // overline: TextStyle(
        //   color: whiteText,
        // ),
        // button: TextStyle(
        //   color: whiteText,
        // ),
      ),
    );
  }
}