import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../state/count_state.dart';

final countViewModelProvider =
    StateNotifierProvider.autoDispose<CountViewModel, AsyncValue<CountState>>(
  (ref) => CountViewModel(ref: ref),
);

class CountViewModel extends StateNotifier<AsyncValue<CountState>> {
  CountViewModel({required AutoDisposeStateNotifierProviderRef ref})
      : super(const AsyncLoading()) {
    load();
  }

  void load() {
    state = const AsyncValue.data(CountState(count: 0));
  }

  void increment() {
    final count = state.value!.count;
    state = AsyncValue.data(CountState(count: count + 1));
  }
}
