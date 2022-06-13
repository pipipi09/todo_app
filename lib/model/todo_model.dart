import 'package:uuid/uuid.dart';

class Todo {
  String? id;
  String? text;
  int? date;
  bool? done;
  int? createdAt;
  int? updatedAt;

  Todo({
    this.id,
    this.text,
    this.date,
    this.done,
    this.createdAt,
    this.updatedAt,
  });

  Todo.newTodo() {
    text = "";
    date = DateTime.now().millisecondsSinceEpoch;
    done = false;
    createdAt = DateTime.now().millisecondsSinceEpoch;
    updatedAt = DateTime.now().millisecondsSinceEpoch;
  }

  assignUUID() {
    id = const Uuid().v4();
  }

  Map<String, dynamic> toMap() => {
        'id': id,
        'text': text,
        'date': date,
        'done': done == true ? 1 : 0,
        'created_at': createdAt,
        'updated_at': updatedAt,
      };

  Todo.fromMap(Map<dynamic, dynamic> map) {
    id = map['id'];
    text = map['text'];
    date = map['date'];
    done = map['done'] == 1;
  }
}
