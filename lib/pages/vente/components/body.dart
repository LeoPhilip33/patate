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
            color: Colors.amber[600],
            child: Text('Entry A'),
          ),
          Container(
            color: Colors.amber[500],
            child: const Center(child: Text('Entry B')),
          ),
          Container(
            color: Colors.amber[100],
            child: const Center(child: Text('Entry C')),
          ),
        ],
      ),
    );
  }
}
