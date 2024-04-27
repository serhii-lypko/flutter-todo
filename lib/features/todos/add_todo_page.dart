import 'package:flutter/material.dart';
import 'todos_page.dart';

class AddTodoPage extends StatefulWidget {
  static const routeName = '/add-todo';

  const AddTodoPage({
    super.key,
  });

  @override
  State<AddTodoPage> createState() => _AddTodoPage();
}

class _AddTodoPage extends State<AddTodoPage> {
  final _formKey = GlobalKey<FormState>();
  final _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add New Todo'),
      ),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: <Widget>[
              TextFormField(
                controller: _controller,
                decoration: InputDecoration(labelText: 'Todo Title'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a title';
                  }
                  return null;
                },
              ),
              ElevatedButton(
                onPressed: () {
                  // final newTodo = TodoItem(id: '3', title: "New todo");
                  // Navigator.pop(context, newTodo);

                  if (_formKey.currentState!.validate()) {
                    final newTodo = TodoItem(id: '3', title: _controller.text);
                    Navigator.pop(context, newTodo);
                  }
                },
                child: Text('Add Todo'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
