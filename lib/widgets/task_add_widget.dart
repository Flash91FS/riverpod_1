import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_1/providers/todos_provider.dart';
import 'package:riverpod_1/utils/colors.dart';

class TaskAddWidget extends ConsumerStatefulWidget {
  const TaskAddWidget({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _TaskAddWidgetState();
}

class _TaskAddWidgetState extends ConsumerState<TaskAddWidget> {
  late final TextEditingController _taskNameController;

  @override
  void initState() {
    super.initState();

    _taskNameController = TextEditingController();
  }

  @override
  void dispose() {
    _taskNameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey[200],
      height: kToolbarHeight,
      margin: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
      padding: const EdgeInsets.only(left: 16, right: 8),
      child: Row(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 16, right: 8),
              child: TextField(
                controller: _taskNameController,
                decoration: const InputDecoration(
                  hintText: 'Add a Task...',
                  border: InputBorder.none,
                  hintStyle: TextStyle(
                    color: hintTextColorLight,
                  ),
                ),
                style: const TextStyle(
                  color: textColorLight,
                ),
              ),
            ),
          ),
          ElevatedButton(
            onPressed: () => _createTask(
              context,
              _taskNameController.text,
            ),
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
              child: const Text(
                'Add',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _createTask(BuildContext context, String name) {
    if (name.isNotEmpty) {
      ref.read(tasksProvider.notifier).addTaskForString(name);
    }
    _taskNameController.text = '';
  }
}
