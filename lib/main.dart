import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:interinteltest/services/theme_service.dart';
import 'package:interinteltest/services/themes.dart';
import 'package:interinteltest/views/home.dart';
import 'package:sizer/sizer.dart';

void main() async{
  await GetStorage.init();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  Sizer(
        builder: (context, orientation, deviceType) {
        return GetMaterialApp(
          theme: Themes.light,
          debugShowCheckedModeBanner: false,
          darkTheme: Themes.dark,
          themeMode: ThemeService().theme,
          home: const MyHomePage(),
          // home:SampleJokes()
        );
      });
  }
}

