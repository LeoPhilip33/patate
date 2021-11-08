// TODO Implement this library.

// library my_prj.globals;

import 'package:flutter/material.dart';

dynamic lat = '-0.587877';
dynamic long = '44.851895';
dynamic suggestion;

String accroche = 'accroche';
String description = 'description';
String adresse = 'adresse';
String surface = 'surface';
String garden = 'jardin';
String stone = 'pierre';
String ciment = 'ciment';
String energy = 'classe énergétique';
String ges = 'classe ges';

var postItem = {
  "id": 5,
  "id_user": 2,
  "accroche": accroche,
  "type": "apartment",
  "nb_rooms": 3,
  "nb_bedroom": 2,
  "description":
      "Situé dans le triangle d'or bordelais, cet appartement de charme...",
  "size": surface,
  "price": 850,
  "address": "32 rue du camel",
  "zip_code": "33000",
  "city": "Bordeaux",
  "latitude": "44.8621337",
  "longitude": "-0.5501113,15z",
  "energy_class": energy,
  "ges_class": ges,
  "has_garden": 0,
  "has_exposed_stone": 5,
  "has_ciment_tiles": 0,
  "has_parquet_floor": 1
};
