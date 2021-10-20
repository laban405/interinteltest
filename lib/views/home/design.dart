import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:interinteltest/widgets/gradient_icon.dart';
import 'package:sizer/sizer.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Design extends StatefulWidget {
  const Design({Key? key}) : super(key: key);

  @override
  _DesignState createState() => _DesignState();
}

class _DesignState extends State<Design> {
  var profile;
  @override
  void initState() {
    getProfileData();
    super.initState();
  }

  getProfileData() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    var _profile = jsonDecode(pref.get("profile").toString());
    setState(() {
      profile = _profile;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            'Design',
            style: Theme.of(context).textTheme.headline6!.copyWith(
                color: Theme.of(context).primaryColor,
                fontWeight: FontWeight.w500,
                fontSize: 16.0.sp),
          ),
          leading: IconButton(
              icon: Icon(
                Icons.arrow_back,
                color: Theme.of(context).primaryColor,
              ),
              onPressed: () => Get.back()),
        ),
        body: userDetails());
  }

  userDetails() {
    return profile == null
        ? Center(
            child: Text(
              'No user details found',
              style: Theme.of(context).textTheme.bodyText2!.copyWith(
                    color: Colors.grey[600],
                    fontWeight: FontWeight.w500,
                  ),
            ),
          )
        : Column(
            children: [
              userCard(),
              myCards(),
            ],
          );
  }

  myCards() {
    return Expanded(
      child: Padding(
        padding: EdgeInsets.all(2.0.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '  My Cards',
              style: Theme.of(context).textTheme.bodyText2!.copyWith(
                    color: Theme.of(context).accentColor,
                    fontSize: 16.0.sp,
                    fontWeight: FontWeight.w500,
                  ),
            ),
            SizedBox(
              width: 96.0.w,
              height: 30.0.h,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: <Widget>[
                  creditCard(),
                  creditCard(),
                  creditCard(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  creditCard() {
    return Container(
      width: 90.0.w,
      height: 10.0.h,
      margin: EdgeInsets.all(3.0.w),
      padding: EdgeInsets.all(3.0.w),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(2.0.w)),
          gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [
                Theme.of(context).primaryColor,
                Theme.of(context).accentColor
              ])),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'InterIntel',
                style: Theme.of(context).textTheme.bodyText2!.copyWith(
                      color: Colors.white,
                      fontSize: 15.0.sp,
                      fontWeight: FontWeight.w500,
                    ),
              ),
              Image.asset(
                'assets/icons/logo.png',
                // height: 10.0.w,
                width: 25.0.w,
              ),
            ],
          ),
          SizedBox(
            height: 3.0.h,
          ),
          // Container(
          //   height: 10.0.w,
          //   width: 12.0.w,
          //   decoration: const BoxDecoration(
          //     color: Colors.yellow
          //   ),
          // ),
          SizedBox(
            height: 3.0.h,
          ),
          Text(
            '* * * *   * * * *   * * * *  1 9 9 6',
            style: Theme.of(context).textTheme.bodyText2!.copyWith(
                  color: Colors.white,
                  fontSize: 16.0.sp,
                  fontWeight: FontWeight.w500,
                ),
          ),
          SizedBox(
            height: 2.5.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '05/22',
                    style: Theme.of(context).textTheme.bodyText2!.copyWith(
                          color: Colors.white,
                          fontSize: 10.0.sp,
                          fontWeight: FontWeight.w500,
                        ),
                  ),
                  Text(
                    'DOE JOHN',
                    style: Theme.of(context).textTheme.bodyText2!.copyWith(
                          color: Colors.white,
                          fontSize: 14.0.sp,
                          fontWeight: FontWeight.w400,
                        ),
                  ),
                ],
              ),
              Image.asset(
                'assets/icons/mastercard.png',
                height: 18.0.w,
                width: 25.0.w,
              ),
            ],
          )
        ],
      ),
    );
  }

  userCard() {
    return Container(
      height: 36.0.h,
      width: 96.0.w,
      margin: EdgeInsets.all(2.0.w),
      decoration: const BoxDecoration(
          // color: Colors.white,
          ),
      child: Card(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ListTile(
              dense: true,
              leading: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GradientIcon(
                    Icons.account_circle_outlined,
                    9.0.w,
                    LinearGradient(
                      colors: <Color>[
                        Theme.of(context).primaryColor,
                        Theme.of(context).accentColor
                      ],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                  ),
                ],
              ),
              title: Text(
                'Name',
                style: Theme.of(context).textTheme.bodyText1!.copyWith(
                    color: Colors.grey[800],
                    fontWeight: FontWeight.w500,
                    fontSize: 14.0.sp),
              ),
              subtitle: Text(
                '${profile['name']}',
                style: Theme.of(context).textTheme.bodyText2!.copyWith(
                      color: Colors.grey[600],
                      fontWeight: FontWeight.w500,
                    ),
              ),
            ),
            ListTile(
              dense: true,
              leading: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GradientIcon(
                    Icons.phone_in_talk_rounded,
                    9.0.w,
                    LinearGradient(
                      colors: <Color>[
                        Theme.of(context).primaryColor,
                        Theme.of(context).accentColor
                      ],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                  ),
                ],
              ),
              title: Text(
                'Phone',
                style: Theme.of(context).textTheme.bodyText1!.copyWith(
                    color: Colors.grey[800],
                    fontWeight: FontWeight.w500,
                    fontSize: 14.0.sp),
              ),
              subtitle: Text(
                '${profile['phoneNumber']}',
                style: Theme.of(context).textTheme.bodyText2!.copyWith(
                      color: Colors.grey[600],
                      fontWeight: FontWeight.w500,
                    ),
              ),
            ),
            ListTile(
              dense: true,
              leading: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GradientIcon(
                    Icons.email_outlined,
                    9.0.w,
                    LinearGradient(
                      colors: <Color>[
                        Theme.of(context).primaryColor,
                        Theme.of(context).accentColor
                      ],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                  ),
                ],
              ),
              title: Text(
                'Email',
                style: Theme.of(context).textTheme.bodyText1!.copyWith(
                    color: Colors.grey[800],
                    fontWeight: FontWeight.w500,
                    fontSize: 14.0.sp),
              ),
              subtitle: Text(
                '${profile['email']}',
                style: Theme.of(context).textTheme.bodyText2!.copyWith(
                      color: Colors.grey[600],
                      fontWeight: FontWeight.w500,
                    ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
