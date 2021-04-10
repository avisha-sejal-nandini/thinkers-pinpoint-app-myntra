import 'package:flutter/material.dart';
import 'package:my_myntra/Screens/Pinpoint/Map/location.dart';
import 'package:provider/provider.dart';
import 'package:geolocator/geolocator.dart';
import 'dart:async';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'package:flutter_polyline_points/flutter_polyline_points.dart';

class AllMaps extends StatelessWidget {
  List lists;
  AllMaps({this.lists});

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
                ? MarkAll(initialPosition: position, lists: lists)
                : Center(
                    child: CircularProgressIndicator(),
                  );
          },
        ),
      ),
    );
  }
}

class MarkAll extends StatefulWidget {
  final Position initialPosition;
  List lists;
  MarkAll({this.initialPosition, this.lists});
  @override
  _MarkAllState createState() => _MarkAllState();
}

class _MarkAllState extends State<MarkAll> {
  final LocationService geoService = LocationService();
  Completer<GoogleMapController> _completer = Completer();
  Map<MarkerId, Marker> markers = {};
  _addMarker(LatLng position, String id, BitmapDescriptor descriptor,
      InfoWindow infoWindow) {
    MarkerId markerId = MarkerId(id + "$position");
    Marker marker = Marker(
        markerId: markerId,
        icon: descriptor,
        position: position,
        infoWindow: infoWindow);
    setState(() {
      markers[markerId] = marker;
    });
  }

  // Map<PolylineId, Polyline> polylines = {};
  // List<LatLng> polylineCoordinates = [];
  // PolylinePoints polylinePoints = PolylinePoints();

  @override
  void initState() {
    setState(() {
      for (int i = 0; i < widget.lists.length; i++) {
        _addMarker(
            LatLng(double.parse(widget.lists[i]['latitude']),
                double.parse(widget.lists[i]['longitude'])),
            "destination",
            BitmapDescriptor.defaultMarker,
            InfoWindow(
              title: widget.lists[i]['name'],
              snippet: widget.lists[i]['city'],
            ));
      }
    });
    geoService.getCurrentLocation().listen((position) {
      centerSceen(position);
      //print(widget.l1);
      print("lllllllllllppppppppppppppppll");
    });
    //_getPolyline();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: GoogleMap(
            //polylines: Set<Polyline>.of(polylines.values),
            markers: Set<Marker>.of(markers.values),
            initialCameraPosition: CameraPosition(
                target: LatLng(widget.initialPosition.latitude,
                    widget.initialPosition.longitude),
                zoom: 5.0),
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
      ),
    );
  }

  Future<void> centerSceen(Position position) async {
    final GoogleMapController controller = await _completer.future;
    // controller.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(
    //     target: LatLng(position.latitude, position.longitude), zoom: 18.0)));
  }
}
