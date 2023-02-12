import 'package:hooks_riverpod/hooks_riverpod.dart';

final tickerProvider = StreamProvider((ref) {
  return Stream.periodic(
    const Duration(milliseconds: 1000),
    (x) => x + 1,
  );
});

final namesProvider = StreamProvider((ref) {
  final a = ref.watch(tickerProvider.stream).map(
        (count) => namesList.getRange(0, count),
      );
  return a;
});

// above code can be return same way as this one below
// final namesProvider = StreamProvider((ref) => ref.watch(tickerProvider.stream).map(
//       (count) => namesList.getRange(0, count),
//     ));

const namesList = [
  'Alice',
  'Bob',
  'Charlie',
  'David',
  'Eve',
  'Fred',
  'Ginny',
  'Harriet',
  'Ileana',
  'Joseph',
];
