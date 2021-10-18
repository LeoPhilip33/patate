import 'package:flutter/material.dart';
import 'package:ynov_immo/pages/home/components/app_bar.dart';
import 'package:ynov_immo/pages/vente/components/body.dart';

class VenteScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: homeAppBar(context),
      body: Vente(),
    );
  }
}
