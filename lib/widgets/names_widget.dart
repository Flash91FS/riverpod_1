import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_1/providers/names_stream_provider.dart';

class NamesWidget extends ConsumerWidget {
  const NamesWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    debugPrint('NamesWidget - build');
    return Consumer(
      builder: (context, ref, child) {
        final names = ref.watch(namesProvider);
        debugPrint('NamesWidget - names = ${names.value}');
        debugPrint('NamesWidget - names.hasError = ${names.hasError}');
        return names.when(
            data: (data) => ListView.builder(
              itemCount: data.length,
              itemBuilder: (context, index) {

                return ListTile(
                  title: Text(data.elementAt(index).toString()),
                );
              },
            ),
            error: (_, __) {
              return const Text('Error: Reached the end of the names List');
            },
            loading: () => const Padding(
              padding: EdgeInsets.all(8.0),
              child: CircularProgressIndicator(),
            ));
      },
    );
  }
}
