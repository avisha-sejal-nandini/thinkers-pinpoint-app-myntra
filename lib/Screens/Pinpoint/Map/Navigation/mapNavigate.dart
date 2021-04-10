import 'package:flutter/material.dart';
import 'package:my_myntra/Screens/Pinpoint/Map/location.dart';
import 'package:provider/provider.dart';
import 'package:geolocator/geolocator.dart';
import 'dart:async';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter/material.dart';
import 'package:my_myntra/Screens/Pinpoint/Map/Navigation/show_directions.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';

class MyMap1 extends StatelessWidget {
  LatLng l1;
  Position initial;
  MyMap1({this.l1, this.initial});

  final geoService = LocationService();
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return FutureProvider(
      create: (context) => geoService.getInitialPosition(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Consumer<Position>(
          builder: (context, position, widget) {
            return (position != null)
                ? Pro1Map1(initialPosition: initial, l1: l1)
                : Center(
                    child: CircularProgressIndicator(),
                  );
          },
        ),
      ),
    );
  }
}

class Pro1Map1 extends StatefulWidget {
  final Position initialPosition;
  LatLng l1;
  Pro1Map1({this.initialPosition, this.l1});
  @override
  _Pro1Map1State createState() => _Pro1Map1State();
}

enum LaunchMode { marker, directions }

class _Pro1Map1State extends State<Pro1Map1> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: ShowDirections(initial: widget.initialPosition, dest: widget.l1),
      ),
    );
  }
}
