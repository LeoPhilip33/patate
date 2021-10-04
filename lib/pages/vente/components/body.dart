import 'package:flutter/material.dart';

class Vente extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: const Center(
          child: TextField(
            decoration: const InputDecoration(
                border: OutlineInputBorder(), hintText: 'Enter a search term'),
          ),
        ),
      ),
    );
  }
}
