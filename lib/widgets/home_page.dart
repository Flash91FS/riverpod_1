import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_1/widgets/count_widget.dart';

import '../main.dart';


class HomePage extends ConsumerWidget {
  const HomePage({Key? key, required this.title}) : super(key: key);

  final String title;


  @override
  Widget build(BuildContext context, WidgetRef ref) {
    debugPrint('HomePage - build');
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: const Center(
        child: CountWidget(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: ref.read(counterProvider.notifier).increment,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}