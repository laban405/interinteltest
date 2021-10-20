import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DictionaryController extends GetxController {
  static DictionaryController instance = Get.find();
  List dictionaryList = [];

  int? groupValue = -1;
  var dictionary = {
    '34': 'thirty-four',
    '90': 'ninety',
    '91': 'ninety-one',
    '21': 'twenty-one',
    '61': 'sixty-one',
    '9': 'nine',
    '2': 'two',
    '6': 'six',
    '3': 'three',
    '8': 'eight',
    '80': 'eighty',
    '81': 'eighty-one',
    'Ninety-Nine': '99',
    'nine-hundred': '900'
  };

  @override
  void onInit() async {
    convertObjToArray(dictionary);
    super.onInit();
  }

  convertObjToArray(mapData) {
    dictionaryList = mapData.entries
        .map((entry) => {"key": entry.key, "value": entry.value})
        .toList();
    update();
  }

  sortList(String value) {
    debugPrint('sorting item $value');
    if (value == "numeric") {
      dictionaryList.sort((a, b) => a['value'].compareTo(b['value']));
      debugPrint('sorting 2 $dictionaryList');
      update();
    } else {
      dictionaryList.sort((a, b) => b['key'].compareTo(a['key']));
      debugPrint('sorting 2 $dictionaryList');
      update();
    }
  }
}
