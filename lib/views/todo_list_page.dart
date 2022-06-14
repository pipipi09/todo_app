import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:todo_app/view_model/count_view_model.dart';
// import 'package:todo_app/db/db_provider.dart';
// import 'package:todo_app/db/repository/todo_repository.dart';
// import 'package:todo_app/model/todo_model.dart';

class TodoListPage extends HookConsumerWidget {
  const TodoListPage({super.key});

  // late TextEditingController _textController;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(countViewModelProvider);
    final viewModel = ref.watch(countViewModelProvider.notifier);

    return state.when(
      data: (data) {
        return Scaffold(
          body: SafeArea(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: viewModel.increment,
                    child: Text(data.count.toString()),
                  ),
                ],
              ),
            ),
          ),
        );
      },
      error: (e, msg) => Text(e.toString()),
      loading: () {
        return const Scaffold(
          body: SafeArea(
            child: Center(
              child: CircularProgressIndicator(),
            ),
          ),
        );
      },
    );
    // return Scaffold(
    //   appBar: AppBar(
    //     title: const Text(
    //       'Todo List',
    //       style: TextStyle(color: Colors.white),
    //     ),
    //     // actions: [
    //     //   IconButton(
    //     //     onPressed: () async {
    //     //       var draft = await Navigator.push(
    //     //         context,
    //     //         MaterialPageRoute(
    //     //           builder: (BuildContext context) => const ListPage(),
    //     //         ),
    //     //       );
    //     //       if (draft != null) {
    //     //         setState(() => _textController.text = draft);
    //     //       }
    //     //     },
    //     //     icon: const Icon(Icons.list),
    //     //   ),
    //     // ],
    //   ),
    //   body: const Center(
    //       // child: ListView(
    //       //   padding: const EdgeInsets.symmetric(horizontal: 24.0),
    //       //   children: [
    //       //     const SizedBox(height: 80),
    //       //     TextFormField(
    //       //       controller: _textController,
    //       //       validator: (value) {
    //       //         if (value == null) {
    //       //           return 'Please enter text';
    //       //         }
    //       //         return null;
    //       //       },
    //       //       decoration: const InputDecoration(
    //       //         filled: true,
    //       //         labelText: 'input',
    //       //       ),
    //       //     ),
    //       //     const SizedBox(height: 20.0),
    //       //     ElevatedButton(
    //       //       child: const Text('送信'),
    //       //       onPressed: () {
    //       //         final date = DateTime.now();
    //       //         final todo = Todo(
    //       //           text: _textController.text,
    //       //           date: date.millisecondsSinceEpoch,
    //       //           done: false,
    //       //           createdAt: date.millisecondsSinceEpoch,
    //       //           updatedAt: date.millisecondsSinceEpoch,
    //       //         );
    //       //         todo.assignUUID();
    //       //         DbProvider.db.createTodo(todo);
    //       //         _textController.clear();
    //       //       },
    //       //     ),
    //       //   ],
    //       // ),
    //       ),
    //   floatingActionButton: FloatingActionButton(
    //     onPressed: () {},
    //     child: const Icon(Icons.add),
    //   ),
    // );
  }
}

// class ListPage extends StatefulWidget {
//   const ListPage({Key? key}) : super(key: key);

//   @override
//   // ignore: library_private_types_in_public_api
//   _ListPageState createState() => _ListPageState();
// }

// class _ListPageState extends State<ListPage> {
//   @override
//   Widget build(BuildContext context) {
//     var futureBuilder = FutureBuilder(
//       future: DbProvider.db.getAllTodos(),
//       builder: (BuildContext context, AsyncSnapshot snapshot) {
//         switch (snapshot.connectionState) {
//           case ConnectionState.none:
//           case ConnectionState.waiting:
//             return const Text('loading...');
//           default:
//             if (snapshot.hasError) {
//               return Text('Error: ${snapshot.error}');
//             }
//             return createListView(context, snapshot);
//         }
//       },
//     );

//     return Scaffold(
//       appBar: AppBar(title: const Text("Todo List")),
//       body: futureBuilder,
//     );
//   }

//   Widget createListView(BuildContext context, AsyncSnapshot snapshot) {
//     List<Todo> todoList = snapshot.data;
//     return ListView.builder(
//       // ignore: unnecessary_null_comparison
//       itemCount: todoList != null ? todoList.length : 0,
//       itemBuilder: (BuildContext context, int index) {
//         Todo todo = todoList[index];
//         return Column(
//           children: <Widget>[
//             ListTile(
//               title: Text(todo.text ?? ''),
//               subtitle: Text(todo.updatedAt.toString()),
//               onTap: () {
//                 final draftBody = todo.text;
//                 final id = todo.id;
//                 if (id == null) return;
//                 DbProvider.db.deleteTodo(id);
//                 Navigator.of(context).pop(draftBody);
//               },
//               onLongPress: () => showDialog(
//                 context: context,
//                 builder: (context) {
//                   return SimpleDialog(
//                     backgroundColor: Colors.grey,
//                     children: <Widget>[
//                       SimpleDialogOption(
//                         onPressed: () {
//                           final draftBody = todo.text;
//                           final id = todo.id;
//                           if (id == null) return;
//                           DbProvider.db.deleteTodo(id);
//                           Navigator.of(context).pop(draftBody);
//                           Navigator.of(context).pop(draftBody);
//                         },
//                         child: const Text(
//                           "編集する",
//                           style: TextStyle(
//                             color: Colors.white,
//                             fontSize: 18.0,
//                           ),
//                         ),
//                       ),
//                       SimpleDialogOption(
//                         onPressed: () {
//                           setState(() {
//                             final id = todo.id;
//                             if (id == null) return;
//                             DbProvider.db.deleteTodo(id);
//                             Navigator.of(context).pop();
//                           });
//                         },
//                         child: const Text(
//                           "削除する",
//                           style: TextStyle(
//                             color: Colors.white,
//                             fontSize: 18.0,
//                           ),
//                         ),
//                       ),
//                     ],
//                   );
//                 },
//               ),
//             ),
//             const Divider(height: 1.0),
//           ],
//         );
//       },
//     );
//   }
// }
