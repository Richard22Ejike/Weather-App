/*
{

  "weather": [
    {

      "main": "Clear",
      "description": "clear sky",
      "icon": "01d"
    }
  ],

  "main": {
    "temp": 282.55,
    "temp_min": 280.37,
    "temp_max": 284.26,
    "pressure": 1023,
    "humidity": 100
  },
  "visibility": 10000,
  "wind": {
    "speed": 1.5,
    "deg": 350
  },

  "dt": 1560350645,
  "sys": {
    "country": "US",
  },
  "timezone": -25200,
  "name": "Mountain View",
  }
 */


class WeatherInfo {
  final String description;
  final String icon;

  WeatherInfo({
    required this.description,
    required this.icon
  });

  factory WeatherInfo.fromJson(Map<String, dynamic> json) {
    final description = json['description'];
    final icon = json['icon'];
    return WeatherInfo(description: description, icon: icon);
  }
}

class WindInfo {
  final double speed;


  WindInfo({
    required this.speed,

  });

  factory WindInfo.fromJson(Map<String, dynamic> json) {
    final speed = json['speed'];

    return WindInfo(speed: speed, );
  }
}
class SysInfo {
  final String country;


  SysInfo({
    required this.country,

  });

  factory SysInfo.fromJson(Map<String, dynamic> json) {
    final country = json['country'];

    return SysInfo(country: country, );
  }
}

class TemperatureInfo {
  final double temperature;
  final double temperaturemax;
  final double temperaturemin;
  final int pressure;
  final int humidity;

  TemperatureInfo({
    required this.temperature,
    required this.temperaturemax,
    required this.temperaturemin,
    required this.pressure,
    required this.humidity,

  });

  factory TemperatureInfo.fromJson(Map<String, dynamic> json) {
    final temperature = json['temp'];
    final temperaturemax = json['temp_max'];
    final temperaturemin = json['temp_min'];
    final pressure = json['pressure'];
    final humidity = json['humidity'];
    return TemperatureInfo(
      temperature: temperature,
      temperaturemax: temperaturemax,
      temperaturemin: temperaturemin,
      pressure: pressure,
      humidity: humidity,
    );
  }
}



class WeatherResponse {
  final String cityName;
  final int timezone;
  final TemperatureInfo tempInfo;
  final WeatherInfo weatherInfo;
  final WindInfo windInfo;
  final SysInfo sysInfo;


  String get iconUrl {
    return 'https://openweathermap.org/img/wn/${weatherInfo.icon}@2x.png';
  }

  WeatherResponse( {
    required this.timezone,
    required this.cityName,
    required this.tempInfo,
    required this.weatherInfo,
    required this.windInfo,
    required this.sysInfo,

  });

  factory WeatherResponse.fromJson(Map<String, dynamic> json) {
    final cityName = json['name'];

    final timezone = json['timezone'];

    final tempInfoJson = json['main'];
    final tempInfo = TemperatureInfo.fromJson(tempInfoJson);

    final weatherInfoJson = json['weather'][0];
    final weatherInfo = WeatherInfo.fromJson(weatherInfoJson);

    final windInfoJson = json['wind'];
    final windInfo = WindInfo.fromJson(windInfoJson);

    final sysInfoJson = json['sys'];
    final sysInfo = SysInfo.fromJson(sysInfoJson);



    return WeatherResponse(
        cityName: cityName,
        tempInfo: tempInfo,
        weatherInfo: weatherInfo,
        windInfo: windInfo,
        timezone: timezone,
        sysInfo: sysInfo,

    );
  }
}