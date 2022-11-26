import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'views/pages/todo_list_page.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

/// main widget
class MyApp extends StatelessWidget {
  /// constructor
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.cyan,
      ),
      home: const TodoListPage(),
    );
  }
}
