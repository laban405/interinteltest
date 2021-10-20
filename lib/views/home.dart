import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:interinteltest/controllers/dictionary_controller.dart';
import 'package:interinteltest/controllers/todo_controller.dart';
import 'package:interinteltest/views/home/info.dart';
import 'package:sizer/sizer.dart';
import 'home/navigation_drawer.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  void initState() {

    super.initState();
    Get.put(DictionaryController());
    Get.put(TodosController());
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: scaffoldKey,
        drawer: const NavigationDrawer(),
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            'Info',
            style: Theme.of(context).textTheme.headline6!.copyWith(
                color: Theme.of(context).primaryColor,
                fontWeight: FontWeight.w500,
                fontSize: 16.0.sp),
          ),
          leading: IconButton(
              icon: Icon(
                Icons.menu_rounded,
                color: Theme.of(context).primaryColor,
              ),
              onPressed: () => scaffoldKey.currentState?.openDrawer()),
        ),
        body: const Info());
  }
}
