import 'dart:convert';
import 'dart:core';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:ynov_immo/api.dart';

// var postItem = {
//   "id": 5,
//   "id_user": 2,
//   "accroche": "Un appartement au style Haussman",
//   "type": "apartment",
//   "nb_rooms": 3,
//   "nb_bedroom": 2,
//   "description":
//       "Situé dans le triangle d'or bordelais, cet appartement de charme...",
//   "size": 50,
//   "price": 850,
//   "address": "32 rue du camel",
//   "zip_code": "33000",
//   "city": "Bordeaux",
//   "latitude": "44.8621337",
//   "longitude": "-0.5501113,15z",
//   "energy_class": "C",
//   "ges_class": "D",
//   "has_garden": 0,
//   "has_exposed_stone": 5,
//   "has_ciment_tiles": 0,
//   "has_parquet_floor": 1
// };

Future<Map<String, dynamic>> callApi(String url) async {
  Client client = Client();
  final response = await client.post(Uri.encodeFull(url),
      headers: {"Access-Control-Allow-Origin": "*"},
      body: json.encode(postItem));
  if (response.statusCode == 200) {
    final result = json.decode(response.body);
    return result;
  } else {
    throw Exception('Failed to load post');
  }
}

class ApiCity extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Map<String, dynamic>>(
      future: callApi('http://api.quentinguiheneuc.fr/api/v1/real-estate/5'),
      builder: (
        BuildContext context,
        AsyncSnapshot<Map<String, dynamic>> snapshot,
      ) {
        print(snapshot.connectionState);
        if (snapshot.connectionState == ConnectionState.waiting) {
          return CircularProgressIndicator();
        } else if (snapshot.connectionState == ConnectionState.done) {
          if (snapshot.hasError) {
            return const Text('Error while loading');
          } else if (snapshot.hasData) {
            //print(snapshot.data['data']['name']);
            //final name = Text(snapshot.data['data']['name']);
            //final result = Text(snapshot.data['data']['name'] +
            //    ' ' +
            //    snapshot.data['data']['zip_code']);
            var ville = City.fromJson(snapshot.data['data']);
            //var listeCity = City.listFromJson(snapshot.data['data']);
            //List liste = listeCity.map((name) => name)
            return Text(ville.name,
                style: TextStyle(
                  color: Colors.black,
                  decoration: TextDecoration.none,
                  fontSize: 14,
                ));
          } else {
            return const Text('Empty data');
          }
        } else {
          return Text('State: ${snapshot.connectionState}');
        }
      },
    );
  }
}
