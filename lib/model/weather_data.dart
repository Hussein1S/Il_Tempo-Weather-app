class WeatherModel {
   final double maxTemp_c;
   final double temp_c;
   final double mintemp_c;
   final String last_update;
   final String region;
  WeatherModel(
      {required this.maxTemp_c,
      required this.last_update,
      required this.mintemp_c,
      required this.region,
      required this.temp_c});
  factory WeatherModel.formJson(dynamic data){
    return WeatherModel(
        maxTemp_c : data['forecast']['forecastday'][0]['day']['maxtemp_c'],
        temp_c : data['current']['temp_c'],
        last_update : data['current']['last_updated'],
        region : data['location']['region'],
        mintemp_c : data['forecast']['forecastday'][0]['day']['mintemp_c'],
    );
  }
  @override
  String toString() {
    return '$maxTemp_c \n $last_update \n $mintemp_c \n $region \n $temp_c';
  }
}
