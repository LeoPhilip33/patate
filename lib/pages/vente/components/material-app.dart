import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'data.dart';


class MyMaterialApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: NavigationExample());
  }
}

class NavigationExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 10.0, top: 20.0),
      child: Column(
        children: <Widget>[
          SizedBox(
            height: 10.0,
          ),
          TypeAheadField(
            textFieldConfiguration: TextFieldConfiguration(
              autofocus: true,
              style: TextStyle(
                color: Colors.black,
                decoration: TextDecoration.none,
                fontSize: 14,
              ),
              decoration: InputDecoration(
                  border: OutlineInputBorder(), hintText: 'Votre adresse'),
            ),
            suggestionsCallback: (pattern) async {
              var test = await BackendService.getSuggestions(pattern);
              print(test);
              return test;
            },
            itemBuilder: (context, Map<String, dynamic> suggestion) {
              return ListTile(
                title: Text(suggestion['label']),
                subtitle: Text('${suggestion['sublabel']}'),
              );
            },
            onSuggestionSelected: (Map<String, String> suggestion) {
              print("suggestion:");
              print(suggestion);
              // your implementation here
            },
          ),
        ],
      ),
    );
  }
}
