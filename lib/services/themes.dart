import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

const MaterialColor kPrimarySwatch = MaterialColor(
  0xff32CD32,
  <int, Color>{
    50: Color(0xffe4f4fb),
    100: Color(0xffe4f4fb),
    200: Color(0xffc9e9f7),
    300: Color(0xffafdff4),
    400: Color(0xff94d4f0),
    500: Color(0xff79c9ec),
    600: Color(0xff5fbfe9),
    700: Color(0xff44b4e5),
    800: Color(0xff29a9e1),
    900: Color(0xff0f9fde),
  },
);

class Themes {
  static final light = ThemeData.light().copyWith(
      appBarTheme: const AppBarTheme().copyWith(
        elevation: 1,
        backgroundColor: Colors.white,
        textTheme: TextTheme(
          headline6: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 14.0.sp,
            color: const Color(0xff59595C),
          ),
        ),
      ),
      scaffoldBackgroundColor: const Color(0xffFAFAFA),
      errorColor: Colors.red[600],
      primaryColor: const Color(0xff1A8AA2),
      accentColor: const Color(0xff59595C),
      disabledColor: Colors.grey[600],
      textTheme: TextTheme(
        caption: TextStyle(
            color: Colors.grey[600],
            fontSize: 11.0.sp,
            fontWeight: FontWeight.w400),
        bodyText1: TextStyle(
            color: Colors.grey[900],
            fontSize: 14.0.sp,
            fontWeight: FontWeight.w600),
        bodyText2: TextStyle(
            color: Colors.grey[800],
            fontSize: 12.0.sp,
            fontWeight: FontWeight.w600),
        subtitle1:
            TextStyle(color: Colors.grey[600], fontWeight: FontWeight.w600),
        headline6: TextStyle(
            color: Colors.grey, fontSize: 16.0.sp, fontWeight: FontWeight.w700),
        headline5: TextStyle(
            color: Colors.grey, fontSize: 26.0.sp, fontWeight: FontWeight.w700),
      ),
      backgroundColor: Colors.white,
      textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(primary: const Color(0xff1A8AA2))),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          primary: const Color(0xff1A8AA2),
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        // floatingLabelBehavior: FloatingLabelBehavior.always,
        contentPadding: EdgeInsets.only(
            left: 3.0.w, right: 3.0.w, bottom: 1.0.w, top: 1.0.w),
        hintStyle: const TextStyle(color: Colors.grey),
        labelStyle: const TextStyle(color: Color(0xff91899D)),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(1.0.w)),
          borderSide: const BorderSide(color: Color(0xff91899D)),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(1.0.w)),
          borderSide: const BorderSide(color: Color(0xff91899D)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(1.0.w)),
          borderSide: const BorderSide(color: Color(0xff1A8AA2)),
        ),
      ),
      colorScheme: ColorScheme.fromSwatch(
        primarySwatch: kPrimarySwatch,
        primaryColorDark: const Color(0xffea5685),
        accentColor: const Color(0xff59595C),
      ).copyWith(secondary: const Color(0xff59595C)));

  static final dark = ThemeData.dark().copyWith(
    backgroundColor: Colors.black,
  );
}
