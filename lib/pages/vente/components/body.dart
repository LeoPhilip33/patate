import 'package:flutter/material.dart';
import 'package:ynov_immo/pages/vente/components/map.dart';
import 'package:ynov_immo/pages/vente/components/material-app.dart';
import 'package:carousel_slider/carousel_slider.dart';

// ignore: must_be_immutable
class Vente extends StatefulWidget {
  @override
  _InputChip createState() => _InputChip();
}

class _InputChip extends State<Vente> {
  List classEnergie = ["A", "B", "C", "D", "E"];
  List classGes = ["A", "B", "C", "D", "E"];

  var myController1 = TextEditingController();
  var myController2 = TextEditingController();
  var myController3 = TextEditingController();
  var myController4 = TextEditingController();

  var image1 =
      "https://bazncamp.com/wp-content/themes/consultix/images/no-image-found-360x250.png";
  var image2 =
      "https://bazncamp.com/wp-content/themes/consultix/images/no-image-found-360x250.png";
  var image3 =
      "https://bazncamp.com/wp-content/themes/consultix/images/no-image-found-360x250.png";
  var image4 =
      "https://bazncamp.com/wp-content/themes/consultix/images/no-image-found-360x250.png";

  List<DropdownMenuItem<String>> _dropDownMenuItems;
  List<DropdownMenuItem<String>> _dropDownMenuItemsGes;

  String _selectedClassEnergie;
  String _selectedClassGes;

  bool isSelectedJardin = false;
  bool isSelectedPierresApparentes = false;
  bool isSelectedCarreauDeCiment = false;

  get target => null;

  void initState() {
    _dropDownMenuItems = buildAndGetDropDownMenuItems(classEnergie);
    _selectedClassEnergie = _dropDownMenuItems[0].value;

    _dropDownMenuItemsGes = buildAndGetDropDownMenuItems(classGes);
    _selectedClassGes = _dropDownMenuItemsGes[0].value;
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

  List<DropdownMenuItem<String>> buildAndGetDropDownMenuItemsGes(
      List energies) {
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
        padding: const EdgeInsets.all(20),
        children: [
          Container(
              child: const Center(
                  child: Padding(
            padding: const EdgeInsets.only(bottom: 30),
            child: Text('Mettre en vente',
                style: TextStyle(
                  color: Colors.black,
                  decoration: TextDecoration.none,
                  fontSize: 25,
                )),
          ))),
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
                              height: 17,
                              color: Colors.yellow[700],
                              width: 17,
                            ),
                          )
                        ],
                      ))),
              TextField(
                decoration: InputDecoration(
                  hintText: 'Ligne d\'accroche',
                ),
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
                      padding: EdgeInsets.only(bottom: 10.0, top: 10.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            margin: const EdgeInsets.only(right: 20.0),
                            child: SizedBox(
                              width: 300,
                              child: TextField(
                                decoration: InputDecoration(
                                  hintText: 'Url de l\'image n°1',
                                ),
                                controller: myController1,
                              ),
                            ),
                          ),
                          GestureDetector(
                            // When the child is tapped, show a snackbar.
                            onTap: () {
                              setState(() {
                                image1 = myController1.text;
                              });
                              debugPrint('Varaible bien enregistré');
                            },
                            // The custom button
                            child: Container(
                                padding: const EdgeInsets.all(12.0),
                                decoration: BoxDecoration(
                                  color: Colors.yellow[700],
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                child: Icon(Icons.add_a_photo_rounded)),
                          ),
                        ],
                      ))),
              Align(
                  alignment: Alignment.topLeft,
                  child: Padding(
                      padding: EdgeInsets.only(bottom: 10.0, top: 10.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            margin: const EdgeInsets.only(right: 20.0),
                            child: SizedBox(
                              width: 300,
                              child: TextField(
                                decoration: InputDecoration(
                                  hintText: 'Url de l\'image n°2',
                                ),
                                controller: myController2,
                              ),
                            ),
                          ),
                          GestureDetector(
                            // When the child is tapped, show a snackbar.
                            onTap: () {
                              setState(() {
                                image2 = myController2.text;
                              });
                              debugPrint('Varaible bien enregistré');
                            },
                            // The custom button
                            child: Container(
                                padding: const EdgeInsets.all(12.0),
                                decoration: BoxDecoration(
                                  color: Colors.yellow[700],
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                child: Icon(Icons.add_a_photo_rounded)),
                          ),
                        ],
                      ))),
              Align(
                  alignment: Alignment.topLeft,
                  child: Padding(
                      padding: EdgeInsets.only(bottom: 10.0, top: 10.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            margin: const EdgeInsets.only(right: 20.0),
                            child: SizedBox(
                              width: 300,
                              child: TextField(
                                decoration: InputDecoration(
                                  hintText: 'Url de l\'image n°3',
                                ),
                                controller: myController3,
                              ),
                            ),
                          ),
                          GestureDetector(
                            // When the child is tapped, show a snackbar.
                            onTap: () {
                              setState(() {
                                image3 = myController3.text;
                              });
                              debugPrint('Varaible bien enregistré');
                            },
                            // The custom button
                            child: Container(
                                padding: const EdgeInsets.all(12.0),
                                decoration: BoxDecoration(
                                  color: Colors.yellow[700],
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                child: Icon(Icons.add_a_photo_rounded)),
                          ),
                        ],
                      ))),
              Align(
                  alignment: Alignment.topLeft,
                  child: Padding(
                      padding: EdgeInsets.only(bottom: 10.0, top: 10.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            margin: const EdgeInsets.only(right: 20.0),
                            child: SizedBox(
                              width: 300,
                              child: TextField(
                                decoration: InputDecoration(
                                  hintText: 'Url de l\'image n°4',
                                ),
                                controller: myController4,
                              ),
                            ),
                          ),
                          GestureDetector(
                            // When the child is tapped, show a snackbar.
                            onTap: () {
                              setState(() {
                                image4 = myController4.text;
                              });
                              debugPrint('Varaible bien enregistré');
                            },
                            // The custom button
                            child: Container(
                                padding: const EdgeInsets.all(12.0),
                                decoration: BoxDecoration(
                                  color: Colors.yellow[700],
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                child: Icon(Icons.add_a_photo_rounded)),
                          ),
                        ],
                      ))),

              CarouselSlider(
                options: CarouselOptions(height: 400.0),
                items: ['$image1', '$image2', '$image3', '$image4'].map((i) {
                  return Builder(
                    builder: (BuildContext context) {
                      return Container(
                          width: MediaQuery.of(context).size.width,
                          margin: EdgeInsets.symmetric(horizontal: 5.0),
                          child: Image.network('$i'));
                    },
                  );
                }).toList(),
              ),

              // FIN Images

              // Surface
              const Align(
                  alignment: Alignment.topLeft,
                  child: Padding(
                      padding: EdgeInsets.only(bottom: 10.0),
                      child: Text('Surface',
                          style: TextStyle(
                            color: Colors.black,
                            decoration: TextDecoration.none,
                            fontSize: 14,
                          )))),

              TextField(
                decoration: InputDecoration(
                  hintText: 'Surface en m²',
                ),
              ),

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
                          backgroundColor: Colors.yellow[700],
                          selected: isSelectedJardin,
                          onSelected: (bool value) {
                            setState(() {
                              isSelectedJardin = value;
                            });
                          },
                          selectedColor: Colors.yellow[900],
                        )),
                    Container(
                        alignment: Alignment.topLeft,
                        child: InputChip(
                          avatar: CircleAvatar(
                            child: Text(''),
                          ),
                          label: Text('Pierres apparentes'),
                          backgroundColor: Colors.yellow[700],
                          selected: isSelectedPierresApparentes,
                          onSelected: (bool value) {
                            setState(() {
                              isSelectedPierresApparentes = value;
                            });
                          },
                          selectedColor: Colors.yellow[900],
                        )),
                    Container(
                        alignment: Alignment.topLeft,
                        child: InputChip(
                          avatar: CircleAvatar(
                            child: Text(''),
                          ),
                          label: Text('Carreaux de ciment'),
                          backgroundColor: Colors.yellow[700],
                          selected: isSelectedCarreauDeCiment,
                          onSelected: (bool value) {
                            setState(() {
                              isSelectedCarreauDeCiment = value;
                            });
                          },
                          selectedColor: Colors.yellow[900],
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
                                  value: _selectedClassGes,
                                  items: _dropDownMenuItemsGes,
                                  onChanged: changedDropDownItemGes,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ))),
              // FIN Critères
            ],
          ),
        ],
      ),
    );
  }

  void changedDropDownItem(String selectedEnergie) {
    setState(() {
      _selectedClassEnergie = selectedEnergie;
    });
  }

  void changedDropDownItemGes(String selectedGes) {
    setState(() {
      _selectedClassGes = selectedGes;
    });
  }
}
