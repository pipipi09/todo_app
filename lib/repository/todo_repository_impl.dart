import 'dart:math';

import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../model/result/result.dart';
import 'todo_repository.dart';

final todoRepositoryProvider =
    Provider<TodoRepository>((ref) => TodoRepositoryImpl(ref.read));

class TodoRepositoryImpl implements TodoRepository {
  TodoRepositoryImpl(this._reader);
  // ignore: unused_field
  final Reader _reader;

  @override
  Future<Result<int>> fetch() async {
    return Result.guardFuture(() async {
      await Future.delayed(const Duration(seconds: 2));
      final rand = Random();
      return rand.nextInt(100);
    });
  }
}
