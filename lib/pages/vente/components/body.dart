import 'package:flutter/material.dart';

class Vente extends StatelessWidget {
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
                            message: "temessagemessagemessagest",
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
                      hintText: 'Enter a search term')),
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
              Wrap(
                spacing: 10.0,
                runSpacing: 20.0,
                children: [
                  Container(
                    child: Text('Jardin :',
                        style: TextStyle(
                          color: Colors.black,
                          decoration: TextDecoration.none,
                          fontSize: 14,
                        )),
                  ),
                  Container(
                    child: Text('Pierres Apparentes :',
                        style: TextStyle(
                          color: Colors.black,
                          decoration: TextDecoration.none,
                          fontSize: 14,
                        )),
                  ),
                  Container(
                    child: Text('Carreaux de ciment :',
                        style: TextStyle(
                          color: Colors.black,
                          decoration: TextDecoration.none,
                          fontSize: 14,
                        )),
                  )
                ],
              ),
              Wrap(
                spacing: 10.0,
                runSpacing: 20.0,
                children: [
                  Container(
                    child: Text('Classe Energie :',
                        style: TextStyle(
                          color: Colors.black,
                          decoration: TextDecoration.none,
                          fontSize: 14,
                        )),
                  ),
                  Container(
                    child: Text('Classe GES :',
                        style: TextStyle(
                          color: Colors.black,
                          decoration: TextDecoration.none,
                          fontSize: 14,
                        )),
                  ),
                ],
              ),
              // FIN Critères
            ],
          ),
        ],
      ),
    );
  }
}
