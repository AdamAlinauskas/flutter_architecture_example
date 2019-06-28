import 'package:meta/meta.dart';

class Todo {
  int id;
  String text;
  bool isComplete;

  Todo({@required this.text});

  Todo.fromDb(Map<String, dynamic> parsedJson)
      : id = parsedJson['id'],
        isComplete = parsedJson['isComplete'] == 1,
        text = parsedJson['text'];

  @override
  String toString() {
    return 'Todo{text: $text}';
  }

  Map<String, dynamic> toMapForDb() {
    return <String, dynamic>{'text': text, 'isComplete': isComplete};
  }

}
