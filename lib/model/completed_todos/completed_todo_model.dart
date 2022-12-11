import 'package:freezed_annotation/freezed_annotation.dart';

part 'completed_todo_model.freezed.dart';
part 'completed_todo_model.g.dart';

@freezed
class CompletedTodoModel with _$CompletedTodoModel {
  const factory CompletedTodoModel({
    /// id
    String? id,

    /// 完了した日付 UnixTime
    required int date,

    /// todos tableのid
    @JsonKey(name: 'todo_id') required String todoId,

    /// 作成日 UnixTime
    @JsonKey(name: 'created_at') @Default(0) int? createdAt,

    /// 更新日 UnixTime
    @JsonKey(name: 'updated_at') @Default(0) int? updatedAt,
  }) = _CompletedTodoModel;

  const CompletedTodoModel._();

  /// JsonからCompletedTodoModelを生成する
  @override
  factory CompletedTodoModel.fromJson(Map<String, dynamic> json) =>
      _$CompletedTodoModelFromJson(json);
}
