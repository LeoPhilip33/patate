import 'package:flutter/material.dart';
import 'package:ynov_immo/pages/vente/components/map.dart';
import 'package:ynov_immo/pages/vente/components/material-app.dart';
import '../../../globals.dart';
import 'dart:convert';

import 'api.dart';
import './api.dart';

import 'dart:core';
import 'package:http/http.dart';

var postItem = {
  "id": 5,
  "id_user": 2,
  "accroche": "Un appartement au style Haussman",
  "type": "apartment",
  "nb_rooms": 3,
  "nb_bedroom": 2,
  "description":
      "Situé dans le triangle d'or bordelais, cet appartement de charme...",
  "size": 50,
  "price": 850,
  "address": "32 rue du camel",
  "zip_code": "33000",
  "city": "Bordeaux",
  "latitude": "44.8621337",
  "longitude": "-0.5501113,15z",
  "energy_class": "C",
  "ges_class": "D",
  "has_garden": 0,
  "has_exposed_stone": 5,
  "has_ciment_tiles": 0,
  "has_parquet_floor": 1
};

// ignore: must_be_immutable
class Vente extends StatefulWidget {
  @override
  _InputChip createState() => _InputChip();
}

class _InputChip extends State<Vente> {
  List classEnergie = ["A", "B", "C", "D", "E"];
  var myController = TextEditingController();

  List<DropdownMenuItem<String>> _dropDownMenuItems;
  String _selectedClassEnergie;

  bool isSelectedJardin = false;
  bool isSelectedPierresApparentes = false;
  bool isSelectedCarreauDeCiment = false;

  get target => null;

  String title;
  String text = "No Value Entered";
  void _setText() {
    setState(() {
      text = title;
    });
  }

  void initState() {
    _dropDownMenuItems = buildAndGetDropDownMenuItems(classEnergie);
    _selectedClassEnergie = _dropDownMenuItems[0].value;
    super.initState();
  }

  List<DropdownMenuItem<String>> buildAndGetDropDownMenuItems(List energies) {
    // ignore: deprecated_member_use
    List<DropdownMenuItem<String>> items = new List();
    for (String energie in energies) {
      items.add(new DropdownMenuItem(value: energie, child: new Text(energie)));
    }
    return items;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ListView(
        padding: const EdgeInsets.all(8),
        children: [
          Container(
              child: const Center(
            child: Text('Mettre en vente',
                style: TextStyle(
                  color: Colors.black,
                  decoration: TextDecoration.none,
                  fontSize: 25,
                )),
          )),
          Column(
            children: [
              // Phrase d'accroche
              Align(
                  alignment: Alignment.topLeft,
                  child: Padding(
                      padding: EdgeInsets.only(bottom: 10.0, top: 20.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(right: 10.0),
                            child: Text('Phrase d\'accroche',
                                style: TextStyle(
                                  color: Colors.black,
                                  decoration: TextDecoration.none,
                                  fontSize: 14,
                                )),
                          ),
                          Tooltip(
                            message:
                                "Phrase d'accroche correspondant à votre bien",
                            child: Image.asset(
                              'assets/images/help.png',
                              height: 15,
                              width: 15,
                            ),
                          )
                        ],
                      ))),
              TextField(
                onChanged: (value) => accroche = value,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Ligne d\'accroche',
                    labelText: 'Title'),
              ),
              // FIN Phrase d'accroche

              // Description
              const Align(
                  alignment: Alignment.topLeft,
                  child: Padding(
                      padding: EdgeInsets.only(bottom: 10.0, top: 20.0),
                      child: Text('Description',
                          style: TextStyle(
                            color: Colors.black,
                            decoration: TextDecoration.none,
                            fontSize: 14,
                          )))),
              const TextField(
                minLines: 7,
                maxLines: 8,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Description du bien'),
              ),
              // FIN Description

              // MAP
              NavigationExample(),
              // FIN MAP
              // ApiCity(),

              SizedBox(
                height: 300,
                child: MapSample(),
              ),

              // Images
              const Align(
                  alignment: Alignment.topLeft,
                  child: Padding(
                      padding: EdgeInsets.only(bottom: 10.0, top: 20.0),
                      child: Text('Images :',
                          style: TextStyle(
                            color: Colors.black,
                            decoration: TextDecoration.none,
                            fontSize: 14,
                          )))),
              Align(
                  alignment: Alignment.topLeft,
                  child: Padding(
                      padding: EdgeInsets.only(bottom: 10.0, top: 20.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: 300,
                            child: TextField(
                              decoration: InputDecoration(
                                hintText: 'Url de l\'image',
                              ),
                              controller: myController,
                            ),
                          ),
                          GestureDetector(
                            // When the child is tapped, show a snackbar.
                            onTap: () {
                              var snackBar =
                                  SnackBar(content: Text(myController.text));

                              ScaffoldMessenger.of(context)
                                  .showSnackBar(snackBar);
                            },
                            // The custom button
                            child: Container(
                                padding: const EdgeInsets.all(12.0),
                                decoration: BoxDecoration(
                                  color: Colors.lightBlue,
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                child: Icon(Icons.add_a_photo_rounded)),
                          ),
                        ],
                      ))),

              // FIN Images

              // Surface
              const Align(
                  alignment: Alignment.topLeft,
                  child: Padding(
                      padding: EdgeInsets.only(bottom: 10.0, top: 20.0),
                      child: Text('Surface',
                          style: TextStyle(
                            color: Colors.black,
                            decoration: TextDecoration.none,
                            fontSize: 14,
                          )))),
              const TextField(
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(), hintText: 'Surface en m²')),
              // FIN Surface

              // Critères
              const Align(
                  alignment: Alignment.topLeft,
                  child: Padding(
                      padding: EdgeInsets.only(bottom: 10.0, top: 20.0),
                      child: Text('Critères :',
                          style: TextStyle(
                            color: Colors.black,
                            decoration: TextDecoration.none,
                            fontSize: 14,
                          )))),
              Align(
                alignment: Alignment.topLeft,
                child: Wrap(
                  alignment: WrapAlignment.center,
                  children: [
                    Container(
                        alignment: Alignment.topLeft,
                        child: InputChip(
                          avatar: CircleAvatar(
                            child: Text(''),
                          ),
                          label: Text('Jardin'),
                          backgroundColor: Colors.grey,
                          selected: isSelectedJardin,
                          onSelected: (bool value) {
                            setState(() {
                              isSelectedJardin = value;
                            });
                          },
                          selectedColor: Colors.green,
                        )),
                    Container(
                        alignment: Alignment.topLeft,
                        child: InputChip(
                          avatar: CircleAvatar(
                            child: Text(''),
                          ),
                          label: Text('Pierres apparentes'),
                          backgroundColor: Colors.grey,
                          selected: isSelectedPierresApparentes,
                          onSelected: (bool value) {
                            setState(() {
                              isSelectedPierresApparentes = value;
                            });
                          },
                          selectedColor: Colors.green,
                        )),
                    Container(
                        alignment: Alignment.topLeft,
                        child: InputChip(
                          avatar: CircleAvatar(
                            child: Text(''),
                          ),
                          label: Text('Carreaux de ciment'),
                          backgroundColor: Colors.grey,
                          selected: isSelectedCarreauDeCiment,
                          onSelected: (bool value) {
                            setState(() {
                              isSelectedCarreauDeCiment = value;
                            });
                          },
                          selectedColor: Colors.green,
                        )),
                  ],
                ),
              ),

              Align(
                  alignment: Alignment.center,
                  child: Padding(
                      padding: EdgeInsets.only(bottom: 10.0, top: 20.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(right: 10.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text('Classe Energie :',
                                    style: TextStyle(
                                      color: Colors.black,
                                      decoration: TextDecoration.none,
                                      fontSize: 14,
                                    )),
                                DropdownButton(
                                  value: _selectedClassEnergie,
                                  items: _dropDownMenuItems,
                                  onChanged: changedDropDownItem,
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(right: 10.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text('Classe GES :',
                                    style: TextStyle(
                                      color: Colors.black,
                                      decoration: TextDecoration.none,
                                      fontSize: 14,
                                    )),
                                DropdownButton(
                                  value: _selectedClassEnergie,
                                  items: _dropDownMenuItems,
                                  onChanged: changedDropDownItem,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ))),
              ElevatedButton(
                onPressed: () {
                  Future<Map<String, dynamic>> callApi(String url) async {
                    Client client = Client();
                    final response = await client.post(Uri.encodeFull(url),
                        headers: {"Access-Control-Allow-Origin": "*"},
                        body: json.encode(postItem));

                    print(response.statusCode);
                    print(json.encode(postItem));
                    if (response.statusCode == 200) {
                      final result = json.decode(response.body);
                      return result;
                    } else {
                      throw Exception('Failed to load post');
                    }
                  }

                  callApi('http://api.quentinguiheneuc.fr/api/v1/real-estate/');
                },
                child: const Text('Submit'),
              ),

              // FIN Critères
            ],
          ),
        ],
      ),
    );
  }

  void changedDropDownItem(String selectedFruit) {
    setState(() {
      _selectedClassEnergie = selectedFruit;
    });
  }
}
