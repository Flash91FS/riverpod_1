import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_1/widgets/home_page.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

//an extension method that works on any value as long as it is a 'num' and we want it to work on optional (nullable) objects of that type
extension OptionalInfixAddition<T extends num> on T? {
  T? operator +(T? other) {
    final shadow = this;
    if (shadow != null) {
      return shadow + (other ?? 0) as T;
    } else {
      return null;
    }
  }
}

void testMyExtensionFunc(){
  final int? a = 5;
  final int b = 6;
  final result = a + b;
  debugPrint('result = $result');
}

final currentTime = Provider((ref) => DateTime.now());

final counterProvider = StateNotifierProvider<Counter, int?>((ref) => Counter());

class Counter extends StateNotifier<int?>{
  Counter(): super(null);
  void increment() {
    state = state ==null? 1: state+1;
    debugPrint('state = $state');
  }
}
