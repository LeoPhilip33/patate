import 'package:flutter/material.dart';
import './data_service.dart';

class Vente extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _MyVenteState();
}

class _MyVenteState extends State<Vente> {
  final _placeTextController = TextEditingController();
  final dataService = DataService();

// class Vente extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ListView(
        padding: const EdgeInsets.all(8),
        children: <Widget>[
          Container(
              child: const Center(
            child: Text('Mettre en vente',
                style: TextStyle(
                  color: Colors.black,
                  decoration: TextDecoration.none,
                  fontSize: 25,
                )),
          )),
          Container(
              child: Padding(
                  padding: EdgeInsets.only(bottom: 10.0, top: 20.0),
                  child: Text('Phrase d\'accroche',
                      style: TextStyle(
                        color: Colors.black,
                        decoration: TextDecoration.none,
                        fontSize: 14,
                      )))),
          Container(
              child: TextField(
            decoration: const InputDecoration(
                border: OutlineInputBorder(), hintText: 'Enter a search term'),
          )),
          Container(
              child: Padding(
                  padding: EdgeInsets.only(bottom: 10.0, top: 20.0),
                  child: Text('Description',
                      style: TextStyle(
                        color: Colors.black,
                        decoration: TextDecoration.none,
                        fontSize: 14,
                      )))),
          Container(
              child: TextField(
            minLines: 7,
            maxLines: 8,
            decoration: const InputDecoration(
                border: OutlineInputBorder(), hintText: 'Description du bien'),
          )),
          Container(
              child: Padding(
                  padding: EdgeInsets.only(bottom: 10.0, top: 20.0),
                  child: Text('Surface',
                      style: TextStyle(
                        color: Colors.black,
                        decoration: TextDecoration.none,
                        fontSize: 14,
                      )))),
          Container(
              child: TextField(
            decoration: const InputDecoration(
                border: OutlineInputBorder(), hintText: 'Surface en m²'),
          )),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 50),
            child: SizedBox(
              width: 150,
              child: TextField(
                  controller: _placeTextController,
                  decoration: InputDecoration(labelText: 'City'),
                  textAlign: TextAlign.center),
            ),
          ),
          ElevatedButton(onPressed: _search, child: Text('Search'))
        ],
      ),
    );
  }

  void _search() {
    DataService.getPlace(_placeTextController.text);
  }
}
