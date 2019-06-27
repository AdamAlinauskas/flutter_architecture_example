import 'package:get_it/get_it.dart';

import 'controllers/todo_controller.dart';
import 'data_access/todo_repository.dart';

class IocContainer {
  static final GetIt _locator = GetIt();

  static t resolve<t>() {
    return _locator<t>();
  }

  static void wireUp() {
    _locator.registerLazySingleton(() => TodoRepository());
    _locator.registerLazySingleton(() => TodoController());
  }
}
