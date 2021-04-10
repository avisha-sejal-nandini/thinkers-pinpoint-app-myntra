import 'package:flutter/material.dart';
import 'package:my_myntra/Screens/Pinpoint/Map/Navigation/mapNavigate.dart';
import 'package:my_myntra/Screens/Pinpoint/Map/location.dart';
import 'package:provider/provider.dart';
import 'package:geolocator/geolocator.dart';
import 'dart:async';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'package:flutter_polyline_points/flutter_polyline_points.dart';

class MyMap extends StatelessWidget {
  LatLng l1;
  MyMap({this.l1});

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
                ? Nav1Map1(initialPosition: position, l1: l1)
                : Center(
                    child: CircularProgressIndicator(),
                  );
          },
        ),
      ),
    );
  }
}

class Nav1Map1 extends StatefulWidget {
  final Position initialPosition;
  LatLng l1;
  Nav1Map1({this.initialPosition, this.l1});
  @override
  _Nav1Map1State createState() => _Nav1Map1State();
}

class _Nav1Map1State extends State<Nav1Map1> {
  final LocationService geoService = LocationService();
  Completer<GoogleMapController> _completer = Completer();
  Map<MarkerId, Marker> markers = {};
  _addMarker(LatLng position, String id, BitmapDescriptor descriptor) {
    MarkerId markerId = MarkerId(id);
    Marker marker =
        Marker(markerId: markerId, icon: descriptor, position: position);
    markers[markerId] = marker;
  }

  final Set<Polyline> _polyline = {};
  List<LatLng> latlngSegment1 = List();

  @override
  void initState() {
    LatLng l2 = LatLng(
        widget.initialPosition.latitude, widget.initialPosition.longitude);
    latlngSegment1.add(widget.l1);
    latlngSegment1.add(l2);
    setState(() {
      _addMarker(LatLng(widget.l1.latitude, widget.l1.longitude), "destination",
          BitmapDescriptor.defaultMarker);
      _polyline.add(Polyline(
        polylineId: PolylineId('line1'),
        visible: true,
        //latlng is List<LatLng>
        points: latlngSegment1,
        width: 2,
        color: Colors.red,
      ));
    });
    geoService.getCurrentLocation().listen((position) {
      centerSceen(position);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: GoogleMap(
            polylines: _polyline,
            markers: Set<Marker>.of(markers.values),
            initialCameraPosition: CameraPosition(
                target: LatLng(widget.initialPosition.latitude,
                    widget.initialPosition.longitude),
                zoom: 8.0),
            mapType: MapType.normal,
            myLocationEnabled: true,
            tiltGesturesEnabled: true,
            compassEnabled: true,
            scrollGesturesEnabled: true,
            zoomGesturesEnabled: true,
            onMapCreated: (GoogleMapController controller) {
              setState(() {
                _completer.complete(controller);
              });
            },
          ),
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.red,
          child: Icon(Icons.navigation_outlined),
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => MyMap1(
                        l1: widget.l1, initial: widget.initialPosition)));
          },
        ),
      ),
    );
  }

  Future<void> centerSceen(Position position) async {
    final GoogleMapController controller = await _completer.future;
    // controller.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(
    //     target: LatLng(position.latitude, position.longitude), zoom: 18.0)));
  }
}
