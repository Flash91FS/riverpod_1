import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_1/enums/city.dart';
import 'package:riverpod_1/providers/city_weather_provider.dart';

class WeatherPage extends ConsumerWidget {
  const WeatherPage({
    Key? key,
    required this.title,
  }) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    debugPrint('WeatherPage - build ');
    final weather = ref.watch(weatherProvider);
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Column(
        children: [
          weather.when(
              data: (data) => Text(data, style: const TextStyle(fontSize: 30),),
              error: (_, __) {
                return const Text('Error');
              },
              loading: () => const Padding(
                padding: EdgeInsets.all(8.0),
                child: CircularProgressIndicator(),
              )),
          Expanded(
            child: ListView.separated(
              itemCount: City.values.length,
              itemBuilder: (context, index) {
                final city = City.values[index];
                final selected = city == ref.watch(cityProvider);

                return ListTile(
                  title: Text(city.toString()),
                  trailing: selected ? const Icon(Icons.check) : null,
                  onTap: () {
                    ref.read(cityProvider.notifier).state = city;
                  },
                );
              },
              separatorBuilder: (BuildContext context, int index) {
                return const Divider(
                  height: 1,
                );
              },
            ),
          ),
        ],
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: ref.read(counterProvider.notifier).increment,
      //   tooltip: 'Increment',
      //   child: const Icon(Icons.add),
      // ),
    );
  }
}
