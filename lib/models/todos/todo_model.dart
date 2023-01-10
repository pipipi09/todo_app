import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:intl/intl.dart';

part 'todo_model.freezed.dart';
part 'todo_model.g.dart';

@freezed
class TodoModel with _$TodoModel {
  const factory TodoModel({
    /// id
    String? id,

    /// Todoの内容
    @Default('') String? text,

    /// Todoを行う日付 UnixTime
    @Default(0) int? date,

    /// 作成日 UnixTime
    @JsonKey(name: 'created_at') @Default(0) int? createdAt,

    /// 更新日 UnixTime
    @JsonKey(name: 'updated_at') @Default(0) int? updatedAt,
  }) = _TodoModel;

  const TodoModel._();

  /// JsonからTodoModelを生成する
  @override
  factory TodoModel.fromJson(Map<String, dynamic> json) =>
      _$TodoModelFromJson(json);

  static String get tableName => 'todos';

  DateTime get dateTime => DateTime.fromMillisecondsSinceEpoch(date ?? 0);

  String get formatDate => DateFormat('yyyy-MM-dd').format(dateTime);
}
