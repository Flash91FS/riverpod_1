import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_1/models/todo.dart';
import 'package:riverpod_1/providers/todos_provider.dart';

class TasksList extends ConsumerWidget {
  const TasksList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    debugPrint('TasksList - build ');
    // rebuild the widget when the todos list changes
    List<Task> todos = ref.watch(tasksProvider);
    debugPrint('TasksList - build: ${todos.length} ');

    if (todos.isEmpty) {
      return const Center(
        child: Text('No Task Added'),
      );
    }

    return ListView(
      children: [
        for (final todo in todos)
          CheckboxListTile(
            value: todo.completed,
            // When tapping on the todos, change its completed status
            onChanged: (value) => ref.read(tasksProvider.notifier).toggle(todo.id),
            title: Text(todo.description),
          ),
      ],
    );
  }
}
