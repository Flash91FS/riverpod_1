import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_1/models/todo.dart';
import 'package:uuid/uuid.dart';

/// {template riverpod.statenotifierprovider}
/// Creates a [StateNotifier] and exposes its current state.
///
/// This provider is used in combination with `package:state_notifier`.
///
/// Combined with [StateNotifier], [StateNotifierProvider] can be used to manipulate
/// advanced states, that would otherwise be difficult to represent with simpler
/// providers such as [Provider] or [FutureProvider].
///
/// For example, you may have a task.dart-list, where you can add and remove
/// and complete a task.dart.
/// Using [StateNotifier], you could represent such state as: TasksNotifier class below
///

///
/// Which you can then pass to a [StateNotifierProvider] like so: i.e. see tasksProvider
///

final tasksProvider = StateNotifierProvider<TasksNotifier, List<Task>>((ref) => TasksNotifier());

class TasksNotifier extends StateNotifier<List<Task>> {
  TasksNotifier() : super([]); /// passing initial state = [] in the super method call

  void addTask(Task todo) {
    state = [...state, todo];
  }
  void addTaskForString(String desc) {

    String taskId = const Uuid().v1(); // creates unique id based on time

    final task = Task(
      id: taskId,
      description: desc,
    );

    state = [...state, task];
  }

  void remove(String todoId) {
    state = [
      for (final todo in state)
        if (todo.id != todoId) todo,
    ];
  }

  void toggle(String todoId) {
    state = [
      for (final todo in state)
        if (todo.id == todoId) todo.copyWith(completed: !todo.completed),
    ];
  }
}
