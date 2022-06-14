import 'package:freezed_annotation/freezed_annotation.dart';

part 'count_state.freezed.dart';

@freezed
class CountState with _$CountState {
  const factory CountState({
    @Default(0) int count,
  }) = _CountState;
}
