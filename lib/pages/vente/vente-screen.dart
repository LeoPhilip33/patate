import 'package:flutter/material.dart';
import 'package:ynov_immo/pages/details/components/body.dart';
import 'package:ynov_immo/pages/home/components/app_bar.dart';
import 'package:ynov_immo/pages/vente/components/body.dart';
import 'package:flutter/material.dart';

import 'components/material-app.dart';

class VenteScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: homeAppBar(context),
      body: VenteScreen(),
    );
  }
}
