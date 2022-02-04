import 'package:flutter/material.dart';

class WeatherModel{
   String weatherStateName;
   DateTime date;
   double minTemp;
   double maxTemp;
   double temp;

  WeatherModel(
      {required this.weatherStateName,
     required this.date,
     required this.minTemp,
      required this.maxTemp,
    required  this.temp});

  factory WeatherModel.jsonDate({required Map date}){
    return WeatherModel(weatherStateName: date['weather_state_name'],
        date: DateTime.parse(date['created']),
        minTemp: date['min_temp'],
        maxTemp: date['max_temp'],
        temp: date['the_temp']);
  }
  String getImage(){
    if(weatherStateName=='Light Cloud' ||weatherStateName=='Heavy Cloud'){
      return 'assets/images/cloudy.png';
    }
    else if(weatherStateName=='Showers' ||weatherStateName=='Light Rain'||weatherStateName=='Heavy Rain'){
      return 'assets/images/rainy.png';
    }
    else if(weatherStateName=='Thunderstorm' ){
      return 'assets/images/thunderstorm.png';
    }
    else if(weatherStateName=='Hail'||weatherStateName=='Sleet'||weatherStateName=='Snow' ){
      return 'assets/images/snow.png';
    }else{
      return 'assets/images/clear.png';
    }
  }

   MaterialColor getColors(){
     if(weatherStateName=='Light Cloud' ||weatherStateName=='Heavy Cloud'){
       return Colors.orange;
     }
     else if(weatherStateName=='Showers' ||weatherStateName=='Light Rain'||weatherStateName=='Heavy Rain'){
       return Colors.blue;
     }
     else if(weatherStateName=='Thunderstorm' ){
       return Colors.indigo;
     }
     else if(weatherStateName=='Hail'||weatherStateName=='Sleet'||weatherStateName=='Snow' ){
       return Colors.lightBlue;
     }else{
       return Colors.orange;
     }
   }
}