import 'dart:async';
import 'dart:io';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
// import 'package:get/state_manager.dart';
import 'dart:convert';
import 'package:interinteltest/models/to_do.dart';
import 'package:interinteltest/utils/httprequests.dart';

class TodosController extends GetxController {
  static TodosController instance = Get.find();
  var isLoading = true;
  var todosList = <TodoModel>[];

  // @override
  // void onInit() async {
  //   // await fetchTodos();
  //   super.onInit();
  // }

  resetTodosList(){
    todosList=<TodoModel>[];
    update();
  }

  Future fetchTodos() async {
    try {
      todosList.clear();
      update();
      isLoading = true;
      update();
      var todosRes = await getData(
          apiUrl:
          "todos?_limit=5");
      debugPrint('todos fetched ${todosRes.body}');
      if (todosRes != null) {
        List list;
        // list.clear();

        list = json.decode(todosRes.body);

        todosList.addAll(list.map((e) => TodoModel.fromJson(e)).toList());
        update();
      }
    } catch (e) {
      debugPrint("Todos error $e");
    } finally {
      isLoading = false;
      update();
    }
  }

  changeTodoState(bool state, int index){
    todosList[index].completed=state;
    update();
  }
}
