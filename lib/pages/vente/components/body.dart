import 'package:flutter/material.dart';
import 'package:ynov_immo/pages/vente/components/material-app.dart';

// ignore: must_be_immutable
class Vente extends StatefulWidget {
  @override
  _InputChip createState() => _InputChip();
}

class _InputChip extends State<Vente> {
  List classEnergie = ["A", "B", "C", "D", "E"];

  List<DropdownMenuItem<String>> _dropDownMenuItems;
  String _selectedClassEnergie;

  bool isSelectedJardin = false;
  bool isSelectedPierresApparentes = false;
  bool isSelectedCarreauDeCiment = false;

  void initState() {
    _dropDownMenuItems = buildAndGetDropDownMenuItems(classEnergie);
    _selectedClassEnergie = _dropDownMenuItems[0].value;
    super.initState();
  }

  List<DropdownMenuItem<String>> buildAndGetDropDownMenuItems(List energies) {
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
              const TextField(
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Ligne d\'accroche')),
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
                        children: [Icon(Icons.add_a_photo_rounded)],
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
