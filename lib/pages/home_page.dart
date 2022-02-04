import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/pages/search_page.dart';
import 'package:weather_app/provider/weatherprovider.dart';

class HomePage extends StatelessWidget {
   HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var data=Provider.of<WeatherProvider>(context,listen: false).weatherDate;
    return Scaffold(
      appBar: AppBar(
        title:const Text('Weather App'),
        actions: [
          IconButton(onPressed: (){
            Navigator.of(context).push(MaterialPageRoute(builder: (context)=> SearchPage()));
          }, icon:const Icon(Icons.search))
        ],
      ),
      body:(Provider.of<WeatherProvider>(context,listen: true).weatherDate==null)? Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children:const [
            Text(
              'there is no weather 😔 start',
              style: TextStyle(
                fontSize: 30,
              ),
            ),
            Text(
              'searching now 🔍',
              style: TextStyle(
                fontSize: 30,
              ),
            )
          ],
        ),
      ):Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              data!.getColors().shade50,
              data!.getColors().shade500,
              data!.getColors().shade900,
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter
          )
        ),

        child: Column(
          children: [
            const Spacer(flex: 3,),
             Text( Provider.of<WeatherProvider>(context,listen: false).cityName==null?'':Provider.of<WeatherProvider>(context,listen: false).cityName!,style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),),
              Text('update : ${data.date.hour.toString()}:${data.date.minute.toString()}'),
            const Spacer(flex: 1,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Image.asset(data.getImage()),
                Text('${data.temp.toInt()}',style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),),
                Column(
                  children: [
                    Text('Max Tamp : ${data.maxTemp.toInt()}'),
                    Text('Min Tamp : ${data.minTemp.toInt()}'),
                  ],
                ),
              ],
            ),
            const Spacer(flex: 1,),
             Text('${data.weatherStateName}',style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),),
            const Spacer(flex: 3,),
          ],
        ),
      )
    );
  }
}
