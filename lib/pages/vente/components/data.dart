import 'dart:async';
import 'package:http/http.dart' as http;
import 'dart:convert';

class BackendService {
  static Future<List<Map<String, String>>> getSuggestions(String query) async {
    if (query.isEmpty && query.length < 3) {
      print('Query needs to be at least 3 chars');
      return Future.value([]);
    }
    /*var url =
        Uri.https('https://api-adresse.data.gouv.fr/search', '/', {'q': query});*/

    var response =
        await http.get('https://api-adresse.data.gouv.fr/search?q=' + query);
    Suggestion suggestion;

    print(response.statusCode);
    if (response.statusCode == 200) {
      suggestion = Suggestion.fromJson(jsonDecode(response.body));

      return Future.value(List.from(suggestion.features));
    } else {
      print('Request failed with status: ${response.statusCode}.');
      return Future.value([]);
    }
  }
}

class Suggestion {
  List<Map<String, String>> features;

  Suggestion({
    this.features,
  });

  Suggestion.fromJson(Map<String, dynamic> json) {
    if (json['features'] != null) {
      features = [];
      json['features'].forEach((v) {
        Map<String, String> feature = {
          'lat': v['geometry']['coordinates'][0].toString(),
          'long': v['geometry']['coordinates'][1].toString(),
          'label': v['properties']['label'],
          'sublabel': v['properties']['context'],
        };
        features.add(feature);
      });
    }
  }
}
