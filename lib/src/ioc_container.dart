import 'package:get_it/get_it.dart';

import 'controllers/todo_controller.dart';
import 'data_access/todo_repository.dart';

class IocContainer {

  static final GetIt getIt = GetIt();

  t resolve<t>(){
    return getIt.get();
  }

  void wireUp(){
    getIt.registerSingleton<TodoRepository>(TodoRepository());
    var repo = getIt.get<TodoRepository>();

    getIt.registerFactory<TodoController>(
            () => TodoController(getIt.get<TodoRepository>()));

    getIt.get<TodoController>();
  }
}