import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_1/enums/city.dart';
import 'package:riverpod_1/extensions/operator_extension.dart';
import 'package:riverpod_1/utils/weather_util.dart';

//will be changed by the UI
final cityProvider = StateProvider<City?>((ref) => null);

final weatherProvider = FutureProvider<WeatherEmoji>((ref) {
  final city = ref.watch(cityProvider);
  if(city!=null){
    return getWeather(city);
  }else{
    return unknownWeatherEmoji;
  }
});

// class City extends StateNotifier<int?> {
//   City() : super(null);
//
//   void increment() {
//     state = state == null ? 1 : state + 1;
//     debugPrint('state = $state');
//   }
// }
