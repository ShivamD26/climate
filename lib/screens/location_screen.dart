import 'package:flutter/material.dart';
import 'package:climate/utilities/constants.dart';
import 'package:climate/services/weather.dart';
import 'package:climate/screens/city_screen.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class LocationScreen extends StatefulWidget {

  LocationScreen( this.locationweather) ;
  final locationweather;
  @override
  _LocationScreenState createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {

  var temp, condition, cityName;
  int temperature = 0;
  var img;
  @override
  void initState() {
    super.initState();
  updateUI(widget.locationweather);
  }

  void updateUI(dynamic weatherData) {
    setState(() {

      if(weatherData == null){
        temperature = 0;
        condition = 900;
        cityName = 'unknown location';

      }

      temp =  weatherData['main']['temp'];
      temperature = temp.toInt();
      condition = weatherData['weather'][0]['id'];
      cityName = weatherData['name'];
      img = weathermodel.getWeatherImg(condition);


    });

  }
  WeatherModel weathermodel = WeatherModel();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/$img.jpg'),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
                Colors.white.withOpacity(0.8), BlendMode.dstATop),
          ),
        ),
        constraints: BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  TextButton(
                    onPressed: () async {
                      var weatherData = await weathermodel.getLocationWeather();
                      updateUI(weatherData);
                    },
                    child: Icon(
                      Icons.near_me,
                      size: 50.0,
                    ),
                  ),
                  TextButton(
                    onPressed: () async{
                      var typedName =  await Navigator.push(context, MaterialPageRoute(builder: (context) => CityScreen()));
                      print(typedName);
                      if(typedName != null){
                       var weatherData =  await weathermodel.getCityWeather(typedName);
                       updateUI(weatherData);
                      }
                    },
                    child: Icon(
                      Icons.location_city,

                      size: 50.0,
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(left: 15.0),
                child: Row(
                  children: <Widget>[
                    Text(
                      '$temperature°',
                      style: kTempTextStyle,
                    ),
                    Text(
                     '${weathermodel.getWeatherIcon(condition)}',
                      style: kConditionTextStyle,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(right: 15.0),
                child: Text(
                  "${weathermodel.getMessage(temperature)} in $cityName",
                  textAlign: TextAlign.right,
                  style: kMessageTextStyle,
                ),
              ),
              SizedBox(height: 10,)
            ],
          ),
        ),
      ),
    );
  }
}

