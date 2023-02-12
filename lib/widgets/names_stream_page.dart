import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_1/widgets/names_widget.dart';

class NamesStreamPage extends ConsumerWidget {
  const NamesStreamPage({
    Key? key,
    required this.title,
  }) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    debugPrint('NamesStreamPage - build ');
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: const NamesWidget(),
    );
  }
}
