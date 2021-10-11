import 'package:http/http.dart' as http;

class DataService {
  static void getPlace(String place) async {
    final queryParameters = {
      'q': place,
    };

    final uri =
        Uri.https('api-adresse.data.gouv.fr', '/search', queryParameters);

    final response = await http.get(uri);

    print(response.body);
  }
}
