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

  static final CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(num.tryParse(globals.long).toDouble(),
        num.tryParse(globals.lat).toDouble()),
    zoom: 14,
  );

<<<<<<< HEAD
  // ignore: unused_field
  static final CameraPosition _kLake = CameraPosition(
=======
  static final CameraPosition _newLocation = CameraPosition(
>>>>>>> 40ab2e3732b74648de83e83fccb6188b3d3ea514
      bearing: 192.8334901395799,
      target: LatLng(num.tryParse(globals.long).toDouble(),
          num.tryParse(globals.lat).toDouble()),
      zoom: 14);

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: GoogleMap(
        mapType: MapType.hybrid,
        initialCameraPosition: _kGooglePlex,
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: _changeLocation,
        label: Text('Rechercher'),
      ),
    );
  }

  Future<void> _changeLocation() async {
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(_newLocation));
  }
}
