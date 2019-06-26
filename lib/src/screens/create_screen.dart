import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/src/controllers/todo_controller.dart';

class CreateScreen extends StatefulWidget {
  @override
  _CreateScreenState createState() => _CreateScreenState();
}

class _CreateScreenState extends State<CreateScreen> {
  @override
  Widget build(BuildContext context) {
    var controller = Provider.of<TodoController>(context);
    var text = '';

    controller.items.forEach((x)=>print(x));

    return Scaffold(
        appBar: AppBar(
          title: Text('Create'),
        ),
        body: Center(
          child: TextField(
            onChanged: (changed){
              text = changed;
            },
            onSubmitted: (submitted){

              controller.create(submitted, context);
            },
          ),
        ));
  }
}
