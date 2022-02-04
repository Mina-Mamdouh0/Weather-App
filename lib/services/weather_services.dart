import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:weather_app/models/weathermodel.dart';
class WeatherService{
  String baseUri='https://www.metaweather.com';
  Future<int> getIdCity({required String nameCity})async
  {
    Uri url=Uri.parse('$baseUri/api/location/search/?query=$nameCity');
    http.Response response =await http.get(url) ;
    List<dynamic> date=jsonDecode(response.body);
    int idCity=date[0]['woeid'];
    return idCity;
  }

  Future<WeatherModel?> getWeather({required String nameCity})async{
    WeatherModel? model;
    try{
      int id=await getIdCity(nameCity: nameCity);
      Uri url=Uri.parse('$baseUri/api/location/$id/');
      http.Response response =await http.get(url) ;
      Map jsonDate=jsonDecode(response.body);
      var date=jsonDate['consolidated_weather'][0];
       model= WeatherModel.jsonDate(date: date);
    }catch(e){
      print(e);
    }
    return model;
  }
}