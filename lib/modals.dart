import 'dart:ffi';

class Humidity {
  final int humidity ;
  Humidity({required this.humidity});
  factory Humidity.fromJson(Map<String, dynamic>json){
    final humidity=json['humidity'];
    return Humidity(humidity: humidity);
  }
}

class WeatherInfo{
  final String description;
  final String icon;
  WeatherInfo({required this.description, required this.icon});
  factory WeatherInfo.fromJson(Map<String, dynamic>json){
    final description=json['description'];
    final icon= json['icon'];
    return WeatherInfo(description: description, icon: icon);
  }
}

class TemperatureInfo{
  final double temperature;
  TemperatureInfo({required this.temperature});

  factory TemperatureInfo.fromJson(Map<String, dynamic>json){
    final temperature = json['temp'];
    return TemperatureInfo(temperature: temperature );
  }
}
/*
class Wind {
  final Double winds ;
  Wind({required this.winds});
  factory Wind.fromJson(Map<String, dynamic>json){
    final wind=json['speed'];
    return Wind(winds: wind);
  }
}*/

class WeatherResponse{
  final String cityName;
  final TemperatureInfo tempInfo;
  final WeatherInfo weatherInfo;
  final Humidity humInfo;
  //final Wind windSpeed;

  WeatherResponse({required this.cityName,
    required this.tempInfo, required this.weatherInfo,
    required this.humInfo, /*required this.windSpeed*/});

  factory WeatherResponse.fromJson(Map<String, dynamic>json){
    final cityName = json['name'];
    final tempInfoJson = json['main'];
    final tempInfo=TemperatureInfo.fromJson(tempInfoJson);
    final humInfoJson=json['main'];
    final humInfo= Humidity.fromJson(humInfoJson);
  //  final windSpeedJson=json['wind'];
   // final windSped= Wind.fromJson(windSpeedJson);

    final weatherInfoJson= json['weather'][0];
    final weatherInfo = WeatherInfo.fromJson(weatherInfoJson);
    return WeatherResponse(
        cityName: cityName, tempInfo: tempInfo,
        weatherInfo: weatherInfo, humInfo: humInfo,
       // windSpeed: windSped
    );
  }
}
/*
class locationWeather{
  final String cityName;
  final TemperatureInfo tempInfo;
  final WeatherInfo weatherInfo;
  final Humidity humInfo;
  //final Wind windSpeed;

  locationWeather({required this.cityName,
    required this.tempInfo, required this.weatherInfo,
    required this.humInfo, /*required this.windSpeed*/});

  locationWeather.fromJson(Map<String, dynamic>json){
    cityName= json['locaction']['name'];
    tempInfo=json['current']['temp'];
    weatherInfo=json['current']['condition']['text'];
    humInfo=json['current']['humidity'];

  }
}*/