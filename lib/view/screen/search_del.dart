import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;


class Search extends SearchDelegate {
  getData(String q) async{
    String baseUrl = 'http://api.weatherapi.com/v1/current.json?';
    String apiKey = 'df3f86927e6941d0bec194403222308';
    String lang = 'eng';
    final response = await http.get(
      Uri.parse(
        '${baseUrl}key=${apiKey}&q=${q}&lang=$lang',
      ),
    );
    if (response.statusCode == 200){
      print(response.body);
    }
  }
  List<String> contries = [
    'Iraq',
    'Italy',
    "England",
    'Poland',
    'Morocco',
  ];
  @override
  List<Widget>? buildActions(BuildContext context) {

    return [ IconButton(onPressed: (){
      query = '';
    }, icon: Icon(Icons.close))
    ];
  }

  @override
  Widget buildResults(BuildContext context) {
    return Center();
  }

  @override
  Widget? buildLeading(BuildContext context) {
    IconButton(onPressed: (){}, icon: Icon(Icons.arrow_back),);
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    List<String> searchContries =
    contries.where((element) => element.contains(query)).toList();
    return ListView.separated(itemBuilder: (context, index) => ListTile(
      onTap: (){
        getData(contries[index]);
      },
      title: query == ''? Text(contries[index]): Text(searchContries[index]),
    ),
        separatorBuilder: (context, index) => Divider(
          thickness: 1,
        ),
        itemCount:query == ''?  contries.length : searchContries.length,
    );
  }

}