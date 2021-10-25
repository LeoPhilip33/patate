import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../../globals.dart' as globals;

class Test extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(child: MapSample());
  }
}

class MapSample extends StatefulWidget {
  @override
  State<MapSample> createState() => MapSampleState();
}

class MapSampleState extends State<MapSample> {
  Completer<GoogleMapController> _controller = Completer();

  var newPosition = CameraPosition(
      target: LatLng(num.tryParse(globals.lat).toDouble(),
          num.tryParse(globals.long).toDouble()),
      zoom: 10);

  static final CameraPosition _initialPosition = CameraPosition(
    target: LatLng(num.tryParse(globals.lat).toDouble(),
        num.tryParse(globals.long).toDouble()),
    zoom: 10,
  );

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: GoogleMap(
        mapType: MapType.hybrid,
        initialCameraPosition: _initialPosition,
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
      ),
    );
  }
}
