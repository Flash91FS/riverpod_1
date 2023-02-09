import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_1/extensions/operator_extension.dart';

final counterProvider = StateNotifierProvider<CounterNotifier, int?>((ref) => CounterNotifier());

class CounterNotifier extends StateNotifier<int?> {
  CounterNotifier() : super(null); //passing initial state = null in the super method call

  void increment() {
    state = state == null ? 1 : state + 1;
    debugPrint('state = $state');
  }
}
