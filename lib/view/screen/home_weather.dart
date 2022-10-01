import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:il_tempo/model/weather_data.dart';
import 'package:il_tempo/view/screen/search_del.dart';
import 'package:il_tempo/view/widgets/weather_body.dart';

class HomeWeather extends StatefulWidget {
  const HomeWeather({Key? key}) : super(key: key);

  @override
  State<HomeWeather> createState() => _HomeWeatherState();
}

class _HomeWeatherState extends State<HomeWeather> {
  WeatherModel? weatherModel ;
  Future<WeatherModel> getData(String q) async {
    String baseUrl = 'http://api.weatherapi.com/v1/forecast.json?';
    String apiKey = 'df3f86927e6941d0bec194403222308';
    String lang = 'ar';
    final response = await http.get(
      Uri.parse(
        '${baseUrl}key=$apiKey&q=$q&lang=$lang',
      ),
    );
    dynamic data = jsonDecode(response.body);
    WeatherModel weatherData12 = WeatherModel.formJson(data);
    return weatherData12;
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          IconButton(
            onPressed: () {
              showSearch(context: context, delegate: Search());
            },
            icon: const Icon(Icons.search),
          ),
        ],
      ),
      body: Container(
        child: Stack(
          alignment: Alignment.center,
        children: [
          Image.asset('images/cloudy.jpg',
            height: double.infinity,
            width: double.infinity,
          fit: BoxFit.cover,),
          FutureBuilder(future: getData('San Fransisco'),
          builder: (context,AsyncSnapshot<WeatherModel> snapshot){
            if (snapshot.hasData){
              WeatherModel? data = snapshot.data;
            return HomeBody(weather:data!);
            }
            else {
              return Center(
                child: CircularProgressIndicator(),
              );
            }},),
        ],
      ),
        alignment: Alignment.center,
      ),
    );
  }
}

