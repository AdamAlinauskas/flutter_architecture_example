import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/src/controllers/todo_controller.dart';

class CreateScreen extends StatefulWidget {
  @override
  _CreateScreenState createState() => _CreateScreenState();
}

class _CreateScreenState extends State<CreateScreen> {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  var text = '';

  @override
  Widget build(BuildContext context) {
    var controller = Provider.of<TodoController>(context);

    controller.items.forEach((x) => print(x));

    return Scaffold(
        appBar: AppBar(
          title: Text('Create'),
        ),
        body: Container(
          padding: EdgeInsets.all(10.0),
          child: Form(
            key: _formKey,
            child: Center(
              child: ListView(
                children: [
                  TextFormField(
                    autofocus: true,
                    onSaved: (value) => text = value,
                    validator: (value) =>
                        value == '' ? 'Please add some text' : null,
                    decoration: InputDecoration(
                        labelText: 'Todo',
                        filled: true,
                        fillColor: Colors.white),
                  ),
                  RaisedButton(
                    onPressed: _submitForm,
                    child: Text(
                      'Create',
                      style: TextStyle(color: Colors.white),
                    ),
                  )
                ],
              ),
            ),
          ),
        ));
  }

  void _submitForm() {
    var form = _formKey.currentState;
    if (!form.validate()) {
      return;
    }
    form.save();

    var controller = Provider.of<TodoController>(context);
    controller.create(text, context);
  }
}
