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
                Icon(Icons.check_box_outline_blank),
                Icon(Icons.check_box),
              ],
            ),
          ),
          body: TabBarView(
            children: <Widget>[
              Center(child: todo(context)),
              Center(
                child: complete(context),
              )
            ],
          ),
        ));
  }

  Widget todo(context) {
    var controller = Provider.of<TodoController>(context);
    if (controller.items.length == 0) return Text('All done, nothing to do');

    return ListView.separated(
        itemCount: controller.items.length,
        itemBuilder: (BuildContext context, int index) {
          return Card(
            child: ListTile(
              title: Text(controller.items[index].text),
              trailing: IconButton(
                icon: Icon(Icons.check),
                onPressed: () => controller.complete(controller.items[index]),
              ),
            ),
          );
        }, separatorBuilder: (BuildContext context, int index) {
          return Container();
    },);
  }

  complete(BuildContext context) {
    var controller = Provider.of<TodoController>(context);
    var items = controller.completedItems;
    if (items.length == 0) return Text('Complete some tasks');

    return ListView.separated(
        itemCount: items.length,
        itemBuilder: (BuildContext context, int index) {
          return Card(
            child: ListTile(
              title: Text(items[index].text),
            ),
          );

        }, separatorBuilder: (BuildContext context, int index) {
          return Container();
    },);
  }
}
