import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../repository/todo_repository.dart';
import '../repository/todo_repository_impl.dart';
import '../state/count_state.dart';

final countViewModelProvider =
    StateNotifierProvider.autoDispose<CountViewModel, AsyncValue<CountState>>(
  (ref) => CountViewModel(ref: ref),
);

class CountViewModel extends StateNotifier<AsyncValue<CountState>> {
  final AutoDisposeStateNotifierProviderRef _ref;
  CountViewModel({required AutoDisposeStateNotifierProviderRef ref})
      : _ref = ref,
        super(const AsyncLoading()) {
    load();
  }

  late final TodoRepository todoRepository = _ref.read(todoRepositoryProvider);

  Future<void> load() async {
    final result = await todoRepository.fetch();
    result.when(
      success: (data) {
        state = AsyncValue.data(CountState(count: data));
      },
      failure: (error) {
        state = AsyncValue.error(error);
      },
    );
  }

  void increment() {
    final count = state.value!.count;
    state = AsyncValue.data(CountState(count: count + 1));
  }
}