import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:uuid/uuid.dart';

import '../models/repeats/repeat_model.dart';
import '../models/result/result.dart';
import '../repositories/repeat_repositoty_impl.dart';
import '../repositories/repository.dart';

final repeatViewModelProvider =
    StateNotifierProvider<RepeatViewModel, AsyncValue<List<RepeatModel>>>(
  (ref) => RepeatViewModel(ref.watch(repeatRepositoryProvider)),
);

class RepeatViewModel extends StateNotifier<AsyncValue<List<RepeatModel>>> {
  RepeatViewModel(this.repeatRepository) : super(const AsyncData([]));

  final Repository<RepeatModel> repeatRepository;

  Future<Result<int>> save(RepeatModel repeat) async {
    const uuid = Uuid();
    if (repeat.id == null) {
      final saveData = repeat.copyWith(id: uuid.v4());
      final result = await repeatRepository.save(saveData);
      return result.when(
        success: (data) {
          return Result.success(data: data);
        },
        failure: (error) {
          state = AsyncValue.error(error);
          return Result.failure(error: error);
        },
      );
    } else {
      final result = await repeatRepository.update(repeat);
      return result.when(
        success: (data) {
          return Result.success(data: data);
        },
        failure: (error) {
          state = AsyncValue.error(error);
          return Result.failure(error: error);
        },
      );
    }
  }
}
