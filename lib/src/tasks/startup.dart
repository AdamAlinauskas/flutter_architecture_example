import 'package:todo/src/data_access/todo_repository.dart';

import '../ioc_container.dart';

class Startup {
   static Future<void> execute () async {
     IocContainer.wireUp();
     // init db
     var repo = IocContainer.resolve<TodoRepository>();
      await repo.init();
   }
}