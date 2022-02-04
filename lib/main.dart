import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/models/weathermodel.dart';
import 'package:weather_app/pages/home_page.dart';
import 'package:weather_app/provider/weatherprovider.dart';



void main() {
  runApp( ChangeNotifierProvider(
      create: (context){
        return WeatherProvider();
      },
      child:WeatherApp()));
}
class WeatherApp extends StatelessWidget {
  const WeatherApp({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return   MaterialApp(
       theme: ThemeData(
         primarySwatch: Provider.of<WeatherProvider>(context,listen: true).weatherDate==null?Colors.blue:
         Provider.of<WeatherProvider>(context,listen: true).weatherDate!.getColors()
       ),
        debugShowCheckedModeBanner: false,
        home: HomePage(),
      );
  }
}