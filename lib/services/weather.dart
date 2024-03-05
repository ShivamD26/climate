import 'package:climate/services/location.dart';
import 'package:climate/services/networking.dart';

const apiKey = 'bf0a3eecf54c56256d586de8d333bdb7';
const baseUrl = 'https://api.openweathermap.org/data/2.5/weather';

class WeatherModel {
  Future<dynamic> getCityWeather(String cityName) async {
    final Uri uri =
        Uri.parse('$baseUrl?q=$cityName&appid=$apiKey&units=metric');

    NetworkHelper networkHelper = NetworkHelper(uri);
    var weatherData = await networkHelper.getData();
    return weatherData;
  }

  Future<dynamic> getLocationWeather() async {
    Location location = Location();
    await location.getCurrentLocation();

    final Uri uri = Uri.parse(
        '$baseUrl?lat=${location.latitude}&lon=${location.longitude}&appid=$apiKey&units=metric');

    NetworkHelper networkHelper = NetworkHelper(uri);

    var weatherData = await networkHelper.getData();

    return weatherData;
  }

  String getWeatherIcon(int condition) {
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

  String getMessage(int temp) {
    if (temp > 25) {
      return 'It\'s 🍦 time';
    } else if (temp > 20) {
      return 'Time for shorts and 👕';
    } else if (temp < 10) {
      return 'You\'ll need 🧣 and 🧤';
    } else if (temp == 0) {
      return 'unable to get weather data';
    } else {
      return 'Bring a 🧥 just in case';
    }
  }


String getWeatherImg(int condition) {
  if (condition < 300) {
    return 'rainy';
  } else if (condition < 400) {
    return 'rainy';
  } else if (condition < 600) {
    return 'rainUmbr';
  } else if (condition < 700) {
    return 'snow';
  } else if (condition < 800) {
    return 'wild';
  } else if (condition == 800) {
    return 'sunny';
  } else if (condition <= 804) {
    return 'clear';
  } else {
    return '🤷‍';
  }
}
}