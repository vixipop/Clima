import 'package:clima/services/location.dart';
import 'package:clima/services/networking.dart';

const apiKey = 'e9ca0b04212d2824b0293e5eda7be436';
const OWMURL = 'https://api.openweathermap.org/data/2.5/weather';

class WeatherModel {

  Future <dynamic> getCityWeather (String cityName) async {
    NetworkHelper networkHelper = NetworkHelper('https://api.openweathermap.org/data/2.5/weather?q=$cityName&appid=$apiKey&units=metric');

    var weatherData = await networkHelper.getData();
    return weatherData;
  }

  Future<dynamic> getLocationWeather() async {
    Location location = Location();
    await location.getCurrentLocation();

    NetworkHelper networkHelper = NetworkHelper('$OWMURL?lat=${location.latitude}&lon=${location.longitude}&appid=$apiKey&units=metric');

    var weatherData = await networkHelper.getData();
    return weatherData;
  }

  String getWeatherIcon(int id) {
    if (id < 300) {
      return '🌩';
    } else if (id < 400) {
      return '🌧';
    } else if (id < 600) {
      return '☔️';
    } else if (id < 700) {
      return '☃️';
    } else if (id < 800) {
      return '🌫';
    } else if (id == 800) {
      return '☀️';
    } else if (id <= 804) {
      return '☁️';
    } else {
      return '🤷‍';
    }
  }

  String getMessage(int temp) {
    if (temp > 28) {
      return 'It\'s 🍦 time';
    } else if (temp > 25) {
      return 'Time for shorts and 👕';
    } else if (temp < 20) {
      return 'You\'ll need 🧣 and 🧤';
    } else {
      return 'Bring a 🧥 just in case';
    }
  }
}
