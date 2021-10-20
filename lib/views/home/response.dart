import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:interinteltest/constants/controllers.dart';
import 'package:interinteltest/controllers/todo_controller.dart';
import 'package:sizer/sizer.dart';

class ResponseView extends StatefulWidget {
  const ResponseView({Key? key}) : super(key: key);

  @override
  _ResponseViewState createState() => _ResponseViewState();
}

class _ResponseViewState extends State<ResponseView> {
  @override
  void initState() {
    todosController.fetchTodos();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            'To Do List Response',
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
        body: completeTasks());
  }

  completeTasks() {
    return GetBuilder<TodosController>(builder: (builder) {
      if (todosController.isLoading) {
        return const Center(
            child: CircularProgressIndicator(
              backgroundColor: Color(0xff59595C),
          color: Color(0xff1A8AA2),
        ));
      }
      if (todosController.todosList.isEmpty) {
        return const Center(
          child: Text('You do not have any todos at the moment'),
        );
      }
      return ListView.builder(
          itemCount: todosController.todosList.length,
          itemBuilder: (context, index) {
            return Container(
              margin: EdgeInsets.all(1.0.w),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(1.0.w))),
              child: CheckboxListTile(
                  activeColor: Theme.of(context).primaryColor,
                  dense: true,
                  title: Text(
                    todosController.todosList[index].title,
                    style: Theme.of(context).textTheme.headline6!.copyWith(
                        color: todosController.todosList[index].completed
                            ? Theme.of(context).primaryColor
                            : Theme.of(context).accentColor,
                        fontWeight: FontWeight.w500,
                        fontSize: 12.0.sp),
                  ),
                  value: todosController.todosList[index].completed,
                  onChanged: (bool? val) {
                    todosController.changeTodoState(val!, index);
                  }),
            );
          });
    });
  }
}
