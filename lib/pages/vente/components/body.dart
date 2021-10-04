import 'package:flutter/material.dart';

class Vente extends StatelessWidget {
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
              child: TextFormField(
            decoration: const InputDecoration(
                border: UnderlineInputBorder(),
                labelText: 'Enter your username'),
          )),
          Container(
              child: TextField(
            decoration: const InputDecoration(
                border: OutlineInputBorder(), hintText: 'Enter a search term'),
          )),
          Container(
              child: TextField(
            decoration: const InputDecoration(
                border: OutlineInputBorder(), hintText: 'Enter a search term'),
          )),
        ],
      ),
    );
  }
}
