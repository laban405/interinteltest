import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:interinteltest/utils/email_validator.dart';
import 'package:interinteltest/views/home/design.dart';
import 'package:interinteltest/widgets/spin_kit.dart';
import 'package:interinteltest/widgets/text_form_field.dart';
import 'package:interinteltest/widgets/toast.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sizer/sizer.dart';

class Info extends StatefulWidget {
  const Info({Key? key}) : super(key: key);

  @override
  _InfoState createState() => _InfoState();
}

class _InfoState extends State<Info> {
  final _formKey = GlobalKey<FormState>();
  bool _isLoading = false;
  String name='';
  String email='';
  String phoneNumber='';
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Container(
          child: Padding(
            padding: EdgeInsets.fromLTRB(5.0.w, 1.0.w, 5.0.w, 1.0.w),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SizedBox(height: 3.0.h),
                  Text(
                    'Hi there, \nplease enter your user details below',
                    style: Theme.of(context)
                        .textTheme
                        .subtitle1!
                        .copyWith(
                      fontSize: 16.0.sp,
                        color: Colors.grey[700]),
                  ),
                  SizedBox(height: 3.0.h),
                  Text(
                    ' Name',
                    style: Theme.of(context).textTheme.subtitle1!.copyWith(
                        fontWeight: FontWeight.w400, fontSize: 12.0.sp),
                  ),
                  SizedBox(
                    height: 0.5.h,
                  ),
                  TextFormField(
                    controller: nameController,
                      cursorColor: Theme.of(context).primaryColorDark,
                      validator: (value) {
                        if (value!.length < 3) {
                          return 'Name is too short';
                        }
                        return null;
                      },
                      onChanged: (value) {
                       name = value;
                      },
                      decoration:
                          textFormFieldBG(context, "Enter name")
                              .copyWith()),
                  SizedBox(
                    height: 4.0.h,
                  ),
                  Text(
                    ' Email',
                    style: Theme.of(context).textTheme.subtitle1!.copyWith(
                        fontWeight: FontWeight.w400, fontSize: 12.0.sp),
                  ),
                  SizedBox(
                    height: 0.5.h,
                  ),
                  TextFormField(
                    controller: emailController,
                      cursorColor: Theme.of(context).primaryColorDark,
                      validator: (String? value) {
                        if (value!.isEmpty) {
                          return 'Email is Required';
                        }
                        if (!RegExp(
                            r"^([a-zA-Z0-9_\-\.]+)@([a-zA-Z0-9_\-\.]+)\.([a-zA-Z]{2,5})$")
                            .hasMatch(value)) {
                          return 'Please enter a valid Email';
                        }
                        return null;
                      },
                      onChanged: (value) {
                        email = value;
                      },
                      decoration:
                      textFormFieldBG(context, "Enter email")
                          .copyWith()),
                  SizedBox(
                    height: 4.0.h,
                  ),
                  Text(
                    ' Phone Number',
                    style: Theme.of(context).textTheme.subtitle1!.copyWith(
                        fontWeight: FontWeight.w400, fontSize: 12.0.sp),
                  ),
                  SizedBox(
                    height: 0.5.h,
                  ),
                  TextFormField(
                    controller: phoneController,
                      keyboardType: TextInputType.number,
                      cursorColor: Theme.of(context).primaryColorDark,
                      validator: (value) {
                        if (value!.length < 10) {
                          return 'Phone number too short';
                        }
                        return null;
                      },
                      onChanged: (value) {
                        phoneNumber = value;
                      },
                      decoration:
                      textFormFieldBG(context, "Enter phone number")
                          .copyWith()),
                  SizedBox(
                    height: 4.0.h,
                  ),
                  Center(
                    child: SizedBox(
                      width: 90.0.w,
                      height: 6.0.h,
                      child: ElevatedButton(
                        style: ButtonStyle(
                            elevation:
                                MaterialStateProperty.resolveWith<double>(
                              (Set<MaterialState> states) => 0.0,
                            ),
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(1.0.w)),
                              // side: BorderSide(color: Colors.red)
                            ))),
                        onPressed: _isLoading
                            ? null
                            : () {
                                _addInfo();
                              },
                        child: _isLoading
                            ? spinkitwhite
                            : Text(
                                'SAVE INFO',
                                style: Theme.of(context)
                                    .textTheme
                                    .subtitle1!
                                    .copyWith(color: Colors.white),
                              ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 4.0.h,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  _addInfo() async {
    var data = {
      "name":name.trim(),
      "email":email.trim(),
      "phoneNumber":phoneNumber.trim()
    };
    SharedPreferences pref = await SharedPreferences.getInstance();

    if (_formKey.currentState!.validate()) {
      debugPrint('save info data $data');
      setState(() {
        _isLoading = true;
      });
      try {
        pref.setString('profile', jsonEncode(data));
        clearData();
        showToast(context, 'Information saved successfully',
            Colors.green, Colors.white);
        Get.to(const Design());
      } catch (e) {
        debugPrint("Save info error $e");
      }
    } else {
      showToast(context, 'Please enter valid details!',
          Theme.of(context).errorColor, Colors.white);
    }
    setState(() {
      _isLoading = false;
    });
  }

  clearData(){
    setState(() {
      name="";
      phoneNumber="";
      email="";
      phoneController.clear();
      nameController.clear();
      emailController.clear();
    });
  }
}
