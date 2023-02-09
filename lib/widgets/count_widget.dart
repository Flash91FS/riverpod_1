import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_1/providers/counter_provider.dart';

class CountWidget extends ConsumerWidget {
  const CountWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    debugPrint('NewWidget - build');
    return Consumer(
      builder: (context, ref, child) {
        final count = ref.watch(counterProvider);
        debugPrint('NewWidget - count = $count');
        final String mText = count?.toString() ?? 'Nothing';
        return Text(
          'Count : $mText',
        );
      },
    );
  }
}
