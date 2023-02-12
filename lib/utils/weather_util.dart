import 'package:riverpod_1/enums/city.dart';

typedef WeatherEmoji = String;

const unknownWeatherEmoji = '☃ unknown';

final cityWeatherMap = {
  City.berlin: 'ð',
  City.paris: '❄️',
  City.tokyo: '⛈',
  City.london: '⛅️',
};

Future<WeatherEmoji> getWeather(City city) {
  return Future.delayed(
    const Duration(milliseconds: 1000),
    () => cityWeatherMap[city] ?? '☀️',
  );
}
