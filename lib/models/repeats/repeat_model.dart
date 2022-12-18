import 'package:freezed_annotation/freezed_annotation.dart';

part 'repeat_model.freezed.dart';
part 'repeat_model.g.dart';

@freezed
class RepeatModel with _$RepeatModel {
  const factory RepeatModel({
    /// id
    String? id,

    /// todos tableのid
    @JsonKey(name: 'todo_id') required String todoId,

    /// 繰り返しの頻度
    /// everyday  = 1
    /// everyweek  = 2
    /// everymonth = 3
    /// everyyear  = 4
    @JsonKey(name: 'frequency_id') required String frequencyId,

    /// 繰り返しを行う時間
    /// 0...23
    @Default(null) int? hour,

    /// 繰り返しを行う分
    /// 0...59
    @Default(null) int? minute,

    /// 繰り返しを行う曜日
    /// monday...sunday = 1...7
    /// https://api.flutter.dev/flutter/dart-core/DateTime/weekday.html
    @Default(null) int? weekday,

    /// 繰り返しを行う日
    /// 1...31
    @Default(null) int? day,

    /// 繰り返しを行う月
    /// 1...12
    @Default(null) int? month,

    /// end
    /// 繰り返しを行う期限
    /// UnixTime
    /// nullの場合は無期限
    @Default(null) int? end,

    /// 作成日 UnixTime
    @JsonKey(name: 'created_at') @Default(0) int? createdAt,

    /// 更新日 UnixTime
    @JsonKey(name: 'updated_at') @Default(0) int? updatedAt,
  }) = _RepeatModel;

  const RepeatModel._();

  /// JsonからRepeatModelを生成する
  @override
  factory RepeatModel.fromJson(Map<String, dynamic> json) =>
      _$RepeatModelFromJson(json);

  static String get tableName => 'repeats';
}
