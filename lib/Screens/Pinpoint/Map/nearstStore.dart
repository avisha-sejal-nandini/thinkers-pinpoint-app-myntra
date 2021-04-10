import 'package:flutter/material.dart';
import 'package:my_myntra/Screens/Pinpoint/Map/location.dart';
import 'package:provider/provider.dart';
import 'package:geolocator/geolocator.dart';
import 'dart:async';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MinMap extends StatelessWidget {
  List list;
  MinMap({this.list});

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
                ? MinMap1(initialPosition: position, l1: list)
                : Center(
                    child: CircularProgressIndicator(),
                  );
          },
        ),
      ),
    );
  }
}

class MinMap1 extends StatefulWidget {
  final Position initialPosition;
  List l1;
  MinMap1({this.initialPosition, this.l1});
  @override
  _MinMap1State createState() => _MinMap1State();
}

class _MinMap1State extends State<MinMap1> {
  final LocationService geoService = LocationService();
  Completer<GoogleMapController> _completer = Completer();
  Map<MarkerId, Marker> markers = {};
  _addMarker(LatLng position, String id, BitmapDescriptor descriptor,
      InfoWindow infoWindow) {
    MarkerId markerId = MarkerId(id);
    Marker marker = Marker(
        markerId: markerId,
        icon: descriptor,
        position: position,
        infoWindow: infoWindow);
    markers[markerId] = marker;
  }

  final Set<Polyline> _polyline = {};
  List<LatLng> latlngSegment1 = List();
  double min = 0;

  int find;
  LatLng li;
  Future<void> getpoints() async {
    for (int i = 0; i < widget.l1.length; i++) {
      double dist = Geolocator.distanceBetween(
          widget.initialPosition.latitude,
          widget.initialPosition.longitude,
          double.parse(widget.l1[i]['latitude']),
          double.parse(widget.l1[i]['longitude']));
      print("ppppppppppppppp");
      print(dist);
      if (i == 0) {
        min = dist;
        find = i;
      }
      if (dist < min) {
        find = i;
        print(i);
      }
    }
    print(widget.l1);
    print("fffffffffffffffffffffff");
    print(find);
    li = LatLng(double.parse(widget.l1[find]['latitude']),
        double.parse(widget.l1[find]['longitude']));
    print(li);
  }

  @override
  void initState() {
    getpoints();
    LatLng l2 = LatLng(
        widget.initialPosition.latitude, widget.initialPosition.longitude);
    latlngSegment1.add(li);
    latlngSegment1.add(l2);
    setState(() {
      _addMarker(
          LatLng(double.parse(widget.l1[find]['latitude']),
              double.parse(widget.l1[find]['longitude'])),
          "destination",
          BitmapDescriptor.defaultMarker,
          InfoWindow(
            title: widget.l1[find]['name'],
            snippet: widget.l1[find]['city'],
          ));
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
                zoom: 10.0),
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
