import 'package:test/test.dart';
import 'package:todo/src/data_access/todo_repository.dart';
import 'package:todo/src/ioc_container.dart';
import 'package:todo/src/tasks/startup.dart';

void main() {
  TodoRepository _repo;
  setUp(() async {
   await Startup.execute().then((controller) async {
      _repo = await IocContainer.resolve<TodoRepository>();
    });
  });

  tearDownAll(() async {
    await _repo.clear();
  });

  group('when getting todos', () {

    test('it should return the count number of todos', () async {
    await _repo.fetchAll().then((todos) async {
       expect(todos.length, 4);
     });
    });
  });
}
