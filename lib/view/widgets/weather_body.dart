import 'package:flutter/material.dart';
import 'package:il_tempo/model/weather_data.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({Key? key, required this.weather}) : super(key: key);
  final WeatherModel weather ;
//              showSearch(context: context, delegate: Search());
  @override
  Widget build(BuildContext context) {
    return
          Container(
            height: 400,
            width: 400,
            alignment: Alignment.center,
            margin: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.blue.withOpacity(0.7),
              borderRadius: BorderRadius.circular(25)
            ),
            child:
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  weather.region,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 30.0,
                    fontWeight: FontWeight.w700,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 30,),
                Text(
                  'Last Update: \n ${weather.last_update}',
                  style: const TextStyle(
                    color: Colors.white,

                    fontSize: 25.0,
                    fontWeight: FontWeight.w400,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: 79.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children:  [
                        Text(
                          '${weather.temp_c}',
                          style: const TextStyle(
                            fontSize: 80.0,
                            color: Colors.white,

                            fontWeight: FontWeight.w400,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        const Padding (
                          padding: EdgeInsets.only(top: 7),
                          child: Text(
                            '\u2103',
                            style: TextStyle(
                              color: Colors.white,

                              fontSize: 20.0,
                              fontWeight: FontWeight.w400,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children:  [
                        Text(
                          'maxTemp: ${weather.maxTemp_c}',
                          style: const TextStyle(
                            fontSize: 20.0,
                            color: Colors.white,

                            fontWeight: FontWeight.w400,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        Padding (
                          padding: const EdgeInsets.only(top: 7),
                          child: Text(
                            'minTemp: ${weather.mintemp_c}',
                            style: const TextStyle(
                              color: Colors.white,

                              fontSize: 20.0,
                              fontWeight: FontWeight.w400,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ],
                    ),

                  ],
                )
              ],
            ),
          );



  }
}



