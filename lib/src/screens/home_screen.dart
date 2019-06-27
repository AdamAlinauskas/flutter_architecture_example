import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/src/routes/navigate.dart';
import 'package:todo/src/controllers/todo_controller.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return DefaultTabController(
        length: 2,
        child: Scaffold(
          floatingActionButton: FloatingActionButton(
              child: Icon(Icons.create),
              onPressed: () {
                Navigate.toHomeScreen(context);
              }),
          appBar: AppBar(
            title: Text('TODO'),
            bottom: TabBar(
              tabs: <Widget>[
                Text(
                  '-',
                  style: TextStyle(fontSize: 32),
                ),
                Icon(Icons.check),
              ],
            ),
          ),
          body: TabBarView(
            children: <Widget>[
              Center(child: todo(context)),
              Center(
                child: CircularProgressIndicator(),
              )
            ],
          ),
        ));
  }

  Widget todo(context) {
    var controller = Provider.of<TodoController>(context);
    if (controller.items.length == 0) return Text('All done, nothing to do');

    return ListView.builder(
        itemCount: controller.items.length,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            title: Text(controller.items[index].text),
          );
        });
  }
}
