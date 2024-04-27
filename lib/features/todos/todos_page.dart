import 'package:flutter/material.dart';

import '../../router/router.dart';
import 'add_todo_page.dart';

class TodosPage extends StatefulWidget {
  static const routeName = '/todos';

  const TodosPage({
    super.key,
  });

  @override
  State<TodosPage> createState() => _TodosPage();
}

class _TodosPage extends State<TodosPage> {
  final todos = TodoList();

  @override
  void initState() {
    super.initState();

    todos.add(TodoItem(id: '1', title: 'First todo'));
    todos.add(TodoItem(id: '2', title: 'Second todo'));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Todos"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: todos.items.length,
                itemBuilder: (context, index) {
                  final item = todos.items[index];
                  return TodoWidget(
                    onTap: () {
                      // Handle tap on todo item
                    },
                    text: item.title,
                  );
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final newTodo =
              await AppRouterConfig.router.push(AddTodoPage.routeName);

          if (newTodo is TodoItem) {
            setState(() {
              todos.add(newTodo);
            });
          }
        },
        backgroundColor: Colors.white,
        child: const Icon(Icons.add),
      ),
    );
  }
}

class TodoItem {
  TodoItem({required this.id, required this.title, this.completed = false});

  final String id;
  final String title;
  bool completed;
}

class TodoList {
  TodoList({List<TodoItem>? items}) : this.items = items ?? [];

  List<TodoItem> items;

  void add(TodoItem item) {
    items.add(item);
  }
}

class TodoWidget extends StatelessWidget {
  const TodoWidget({Key? key, required this.onTap, required this.text})
      : super(key: key);

  final VoidCallback onTap;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          width: double.infinity,
          height: 60.0, // Set a specific height
          padding: const EdgeInsets.all(12.0),
          decoration: BoxDecoration(
            color: Colors.white, // Change color to white
            borderRadius: BorderRadius.circular(8.0),
            border: Border.all(color: Colors.black, width: 2.0), // Add a border
          ),
          child: Center(
            child: Text(
              text,
              style:
                  TextStyle(color: Colors.black), // Change text color to black
            ),
          ),
        ),
      ),
    );
  }
}


// final newTodo = await AppRouterConfig.router.push(AddTodoPage.routeName);

// if (result is TodoItem) {
//   todos.add(result);
// }