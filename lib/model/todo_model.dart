class Todo {
  int? id;
  String? text;
  int? date;
  bool? done;
  DateTime? createdAt;
  DateTime? updatedAt;

  Todo({
    this.id,
    this.text,
    this.date,
    this.done,
    this.createdAt,
    this.updatedAt,
  });

  Map<String, dynamic> toMap() => {
        'id': id,
        'text': text,
        'date': date,
        'done': done == true ? 1 : 0,
      };

  Todo.fromMap(Map<dynamic, dynamic> map) {
    id = map['id'];
    text = map['text'];
    date = map['date'];
    done = map['done'] == 1;
  }
}
