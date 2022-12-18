import 'package:hooks_riverpod/hooks_riverpod.dart';

final displayDateViewModelProvider =
    StateNotifierProvider<DisplayDateViewModel, DateTime>(
  (ref) => DisplayDateViewModel(),
);

class DisplayDateViewModel extends StateNotifier<DateTime> {
  DisplayDateViewModel() : super(DateTime.now());

  void changeDate(DateTime date) {
    state = date;
  }
}
