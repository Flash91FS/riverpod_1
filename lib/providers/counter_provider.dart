import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_1/extensions/operator_extension.dart';

final counterProvider = StateNotifierProvider<Counter, int?>((ref) => Counter());

class Counter extends StateNotifier<int?> {
  Counter() : super(null);

  void increment() {
    state = state == null ? 1 : state + 1;
    debugPrint('state = $state');
  }
}
