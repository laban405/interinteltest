import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:interinteltest/constants/controllers.dart';
import 'package:interinteltest/controllers/dictionary_controller.dart';
import 'package:interinteltest/widgets/gradient_icon.dart';
import 'package:sizer/sizer.dart';

class Dictionary extends StatefulWidget {
  const Dictionary({Key? key}) : super(key: key);

  @override
  _DictionaryState createState() => _DictionaryState();
}

class _DictionaryState extends State<Dictionary> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            'Dictionary',
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
          actions: [
            IconButton(
                icon: Icon(
                  Icons.sort_rounded,
                  color: Theme.of(context).primaryColor,
                ),
                onPressed: () {
                  sortDialog();
                }),
          ],
        ),
        body: completeTasks());
  }

  completeTasks() {
    return  GetBuilder<DictionaryController>(
        builder: (_c) =>ListView.builder(
        itemCount: dictionaryController.dictionaryList.length,
        itemBuilder: (context, index) {
          return Container(
            margin: EdgeInsets.all(1.0.w),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(1.0.w))),
            child: ListTile(
              dense: true,
              leading: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GradientIcon(
                    Icons.confirmation_number_rounded,
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
                '${dictionaryController.dictionaryList[index]["key"]}',
                style: Theme.of(context).textTheme.bodyText1!.copyWith(
                    color: Colors.grey[800],
                    fontWeight: FontWeight.w500,
                    fontSize: 14.0.sp),
              ),
              subtitle: Text(
                '${dictionaryController.dictionaryList[index]["value"]}',
                style: Theme.of(context).textTheme.bodyText2!.copyWith(
                      color: Colors.grey[600],
                      fontWeight: FontWeight.w500,
                    ),
              ),
            ),
          );
        }));
  }


  sortDialog() {
    return showDialog<void>(
        context: context,
        builder: (BuildContext context) {
          int? selectedRadio = 0;
          return AlertDialog(
            titlePadding:EdgeInsets.only(left: 5.0.w,top: 2.0.w),
            contentPadding: EdgeInsets.fromLTRB(2.0.w,0.0.w,2.0.w,0.0.w),
            title: Text(
              'Sort By',
              style: Theme.of(context).textTheme.bodyText1!.copyWith(
                  color: Theme.of(context).primaryColor,
                  fontWeight: FontWeight.w500,
                  fontSize: 14.0.sp),
            ),
            content: StatefulBuilder(
              builder: (BuildContext context, StateSetter setState) {
                return Container(
                  // color: Colors.red,
                  height: 16.0.h,
                  child: Column(
                    children: [
                      const Divider(),
                      ListTile(
                        dense: true,
                        leading: Radio(
                          toggleable: true,
                          value: 1,
                          groupValue: selectedRadio,
                          onChanged: (int? value) {
                            setState(() => selectedRadio = value);
                            dictionaryController.sortList("numeric");
                            // print('grp value is ${dictionaryController.groupValue}');
                          },
                          activeColor: Theme.of(context).primaryColor,
                        ),
                        title: Text(
                          'Numeric (Ascending)',
                          style: Theme.of(context)
                              .textTheme
                              .bodyText1!
                              .copyWith(
                                  color: Colors.grey[800],
                                  fontWeight: FontWeight.w500,
                                  fontSize: 12.0.sp),
                        ),
                      ),
                      ListTile(
                        dense: true,
                        leading: Radio(
                          toggleable: true,
                          value: 2,
                          groupValue: selectedRadio,
                          onChanged: (int? value) {
                            setState(() => selectedRadio = value);
                            dictionaryController.sortList("alpha");
                          },
                          activeColor: Theme.of(context).primaryColor,
                        ),
                        title: Text(
                          'Alpha Keys (Ascending)',
                          style: Theme.of(context)
                              .textTheme
                              .bodyText1!
                              .copyWith(
                                  color: Colors.grey[800],
                                  fontWeight: FontWeight.w500,
                                  fontSize: 12.0.sp),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          );
        });
  }
}
