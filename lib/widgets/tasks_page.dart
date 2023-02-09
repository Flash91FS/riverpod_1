import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_1/widgets/task_add_widget.dart';
import 'package:riverpod_1/widgets/tasks_list.dart';

class TasksPage extends ConsumerWidget {
  const TasksPage({
    Key? key,
    required this.title,
  }) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    debugPrint('TasksPage - build ');
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Column(
        children: const [
          TaskAddWidget(),
          Expanded(child: TasksList()),
        ],
      ),
    );
  }
}
