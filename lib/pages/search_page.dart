
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/models/weathermodel.dart';
import 'package:weather_app/provider/weatherprovider.dart';
import 'package:weather_app/services/weather_services.dart';

class SearchPage extends StatelessWidget {
   SearchPage({Key? key}) : super(key: key);
 String? searchName;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:const Text('Search a City'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: TextField(

             keyboardType: TextInputType.name,
              onSubmitted: (value)async{
               searchName=value;
               WeatherService weatherService=WeatherService();
               WeatherModel? weatherModel=await weatherService.getWeather(nameCity: searchName!);
               Provider.of<WeatherProvider>(context,listen: false).weatherDate=weatherModel;
               Provider.of<WeatherProvider>(context,listen: false).cityName=searchName;
               Navigator.of(context).pop();

              },
             decoration: InputDecoration(
               contentPadding:const EdgeInsets.symmetric(vertical: 25,horizontal: 15),
               suffixIcon:const Icon(Icons.search),
               hintText: 'Enter The City',
               labelText: 'Search',
               border: OutlineInputBorder(
                 borderRadius: BorderRadius.circular(5),
               )
             ),
          ),
        ),
      ),
    );
  }
}
