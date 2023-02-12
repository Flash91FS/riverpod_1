import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_1/widgets/counter_page.dart';
import 'package:riverpod_1/extensions/operator_extension.dart';
import 'package:riverpod_1/widgets/tasks_page.dart';
import 'package:riverpod_1/widgets/weather_page.dart';

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
      // home: const CounterPage(title: 'Counter Page'),
      // home: const TasksPage(title: 'Tasks Page'),
      home: const WeatherPage(title: 'Weather Page'),
    );
  }
}

void testMyExtensionFunc() {
  final int? a = 5;
  final int b = 6;
  final result = a + b;
  debugPrint('result = $result');
}

// final currentTime = Provider((ref) => DateTime.now());
