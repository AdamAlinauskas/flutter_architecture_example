import 'package:todo/src/controllers/todo_controller.dart';
import 'package:todo/src/data_access/todo_repository.dart';

import '../ioc_container.dart';

class Startup {
   static Future<TodoController> execute () async {
     IocContainer.wireUp();
     var repo = IocContainer.resolve<TodoRepository>();
     var todoController = IocContainer.resolve<TodoController>();
      await repo.init();
      return todoController;
   }
}