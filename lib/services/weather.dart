import 'package:clima/services/location.dart';
import 'package:clima/services/networking.dart';

const API_KEY = "b08a5e8c6ffac55484b6c1d56c899fcd";
const openWeatherMapURL = 'https://api.openweathermap.org/data/2.5/weather';

class WeatherModel {
  double _latitude, _longitude;

  Future<dynamic> getCityWeather(String cityName) async {
    NetworkHelper nh = NetworkHelper(
        "$openWeatherMapURL?q=$cityName&appid=$API_KEY&units=metric");
    var weatherData = await nh.getData();
    return weatherData;
  }

  Future<dynamic> getLocationWeather() async {
    var location = Location();
    await location.getLocation();
    _latitude = location.getLatitude();
    _longitude = location.getLongitude();

    NetworkHelper networkHelper = NetworkHelper(
        "https://api.openweathermap.org/data/2.5/weather?lat=$_latitude&lon=$_longitude&units=metric&appid=$API_KEY");
    var weatherData = await networkHelper.getData();
    return weatherData;
  }

  static String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '🌩';
    } else if (condition < 400) {
      return '🌧';
    } else if (condition < 600) {
      return '☔️';
    } else if (condition < 700) {
      return '☃️';
    } else if (condition < 800) {
      return '🌫';
    } else if (condition == 800) {
      return '☀️';
    } else if (condition <= 804) {
      return '☁️';
    } else {
      return '🤷‍';
    }
  }

  static String getMessage(int temp) {
    if (temp > 25) {
      return 'It\'s 🍦 time';
    } else if (temp > 20) {
      return 'Time for shorts and 👕';
    } else if (temp < 10) {
      return 'You\'ll need 🧣 and 🧤';
    } else {
      return 'Bring a 🧥 just in case';
    }
  }
}
