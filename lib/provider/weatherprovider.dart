import 'package:flutter/material.dart';
import 'package:weather_app/models/weathermodel.dart';

class WeatherProvider extends ChangeNotifier{
  WeatherModel? _weatherModel;
  String? _nameCity;
  set weatherDate(WeatherModel? weather){
    _weatherModel=weather;
    notifyListeners();
  }
  WeatherModel? get weatherDate=>_weatherModel;

  set cityName(String? city){
    _nameCity=city;
    notifyListeners();
  }
  String? get cityName=>_nameCity;

}