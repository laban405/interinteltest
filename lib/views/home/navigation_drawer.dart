import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:interinteltest/views/home.dart';
import 'package:interinteltest/views/home/design.dart';
import 'package:interinteltest/views/home/dictionary.dart';
import 'package:interinteltest/views/home/response.dart';
import 'package:sizer/sizer.dart';

class NavigationDrawer extends StatefulWidget {
  const NavigationDrawer({Key? key}) : super(key: key);

  @override
  _NavigationDrawerState createState() => _NavigationDrawerState();
}

class _NavigationDrawerState extends State<NavigationDrawer> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 80.0.w,
      child: Drawer(
        child: Container(
          padding: EdgeInsets.only(left: 3.0.w,right: 3.0.w),
          decoration: BoxDecoration(color: Theme.of(context).backgroundColor),
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              SizedBox(
                height: 6.0.h,
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(6.0.w, 3.0.w, 15.0.w, 5.0.w),
                child: Image.asset(
                  'assets/icons/logo.png',
                  fit: BoxFit.contain,
                ),
              ),
              const Divider(),
              ListTile(
                title: Row(
                  children: <Widget>[
                    Icon(
                      Icons.info,
                      color: Theme.of(context).accentColor,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Text(
                        'Info',
                        style: Theme.of(context).textTheme.headline6!.copyWith(
                            color: Theme.of(context).accentColor,
                            fontWeight: FontWeight.w500,
                            fontSize: 14.0.sp),
                      ),
                    ),
                  ],
                ),
                onTap: () {
                  Get.offAll(() => const MyHomePage());
                },
              ),
              ListTile(
                title: Row(
                  children: <Widget>[
                    Icon(
                      Icons.design_services,
                      color: Theme.of(context).accentColor,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Text(
                        'Design',
                        style: Theme.of(context).textTheme.headline6!.copyWith(
                            color: Theme.of(context).accentColor,
                            fontWeight: FontWeight.w500,
                            fontSize: 14.0.sp),
                      ),
                    ),
                  ],
                ),
                onTap: () {
                  Get.to(() => const Design());
                },
              ),
              ListTile(
                title: Row(
                  children: <Widget>[
                    Icon(
                      Icons.feedback_rounded,
                      color: Theme.of(context).accentColor,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Text(
                        'Response',
                        style: Theme.of(context).textTheme.headline6!.copyWith(
                            color: Theme.of(context).accentColor,
                            fontWeight: FontWeight.w500,
                            fontSize: 14.0.sp),
                      ),
                    ),
                  ],
                ),
                onTap: () {
                  Get.to(() => const ResponseView());
                },
              ),
              ListTile(
                title: Row(
                  children: <Widget>[
                    Icon(
                      Icons.book_rounded,
                      color: Theme.of(context).accentColor,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Text(
                        'Dictionary',
                        style: Theme.of(context).textTheme.headline6!.copyWith(
                            color: Theme.of(context).accentColor,
                            fontWeight: FontWeight.w500,
                            fontSize: 14.0.sp),
                      ),
                    ),
                  ],
                ),
                onTap: () {
                  Get.to(() => const Dictionary());
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
