import 'package:hooks_riverpod/hooks_riverpod.dart';

final dateViewModelProvider = StateNotifierProvider<DateViewModel, DateTime>(
  (ref) => DateViewModel(),
);

class DateViewModel extends StateNotifier<DateTime> {
  DateViewModel() : super(DateTime.now());

  void changeDate(DateTime date) {
    state = date;
  }
}
