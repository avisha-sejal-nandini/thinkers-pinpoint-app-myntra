import 'package:flutter/material.dart';
import 'package:map_launcher/map_launcher.dart';
import 'maps_sheet.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';

class ShowDirections extends StatefulWidget {
  Position initial;
  LatLng dest;
  ShowDirections({this.dest, this.initial});

  @override
  _ShowDirectionsState createState() => _ShowDirectionsState();
}

class _ShowDirectionsState extends State<ShowDirections> {
  double destinationLatitude;

  double destinationLongitude;
  String destinationTitle = 'Destination';

  double originLatitude = 0;
  double originLongitude = 0;
  String originTitle = 'start';

  // List<Coords> waypoints = [];

  DirectionsMode directionsMode = DirectionsMode.driving;
  @override
  void initState() {
    destinationLatitude = widget.dest.latitude;
    destinationLongitude = widget.dest.longitude;
    originLatitude = widget.initial.latitude;
    originLongitude = widget.initial.longitude;

    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            'assets/navigation.jpg',
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
          ),
          Container(
            color: Colors.white.withOpacity(0.6),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 85.0),
              child: Material(
                color: Colors.black,
                elevation: 10.0,
                borderRadius: BorderRadius.circular(10.0),
                child: MaterialButton(
                  onPressed: () {
                    MapsSheet.show(
                      context: context,
                      onMapTap: (map) {
                        map.showDirections(
                          destination: Coords(
                            destinationLatitude,
                            destinationLongitude,
                          ),
                          destinationTitle: destinationTitle,
                          origin: Coords(originLatitude, originLongitude),
                          originTitle: originTitle,
                          directionsMode: directionsMode,
                        );
                      },
                    );
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.directions_car_rounded,
                          color: Colors.white,
                          size: 28.0,
                        ),
                        Text(
                          ' Navigate',
                          style: TextStyle(color: Colors.white, fontSize: 13.0),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class FormTitle extends StatelessWidget {
  final String title;
  final Widget trailing;

  FormTitle(this.title, {this.trailing});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 20),
        Row(
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Colors.blue,
              ),
            ),
            Spacer(),
            if (trailing != null) trailing,
          ],
        ),
      ],
    );
  }
}

class WaypointsForm extends StatelessWidget {
  final List<Coords> waypoints;
  final void Function(List<Coords> waypoints) onWaypointsUpdated;

  WaypointsForm({@required this.waypoints, @required this.onWaypointsUpdated});

  void updateWaypoint(Coords waypoint, int index) {
    final tempWaypoints = [...waypoints];
    tempWaypoints[index] = waypoint;
    onWaypointsUpdated(tempWaypoints);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ...waypoints.map((waypoint) {
          final waypointIndex = waypoints.indexOf(waypoint);
          return [
            FormTitle(
              'Waypoint #${waypointIndex + 1}',
              trailing: IconButton(
                icon: Icon(Icons.delete, color: Colors.red[300]),
                onPressed: () {
                  onWaypointsUpdated([...waypoints]..removeAt(waypointIndex));
                },
              ),
            ),
            TextFormField(
              autocorrect: false,
              autovalidateMode: AutovalidateMode.disabled,
              decoration: InputDecoration(
                labelText: 'Waypoint #${waypointIndex + 1} latitude',
              ),
              initialValue: waypoint.latitude.toString(),
              onChanged: (newValue) {
                updateWaypoint(
                  Coords(double.tryParse(newValue) ?? 0, waypoint.longitude),
                  waypointIndex,
                );
              },
            ),
            TextFormField(
              autocorrect: false,
              autovalidateMode: AutovalidateMode.disabled,
              decoration: InputDecoration(
                labelText: 'Waypoint #$waypointIndex longitude',
              ),
              initialValue: waypoint.longitude.toString(),
              onChanged: (newValue) {
                updateWaypoint(
                  Coords(waypoint.latitude, double.tryParse(newValue) ?? 0),
                  waypointIndex,
                );
              },
            ),
          ];
        }).expand((element) => element),
        SizedBox(height: 20),
        Row(children: [
          MaterialButton(
            child: Text(
              'Add Waypoint',
              style: TextStyle(
                // color: Colors.blue,
                fontWeight: FontWeight.w600,
              ),
            ),
            onPressed: () {
              onWaypointsUpdated([...waypoints]..add(Coords(0, 0)));
            },
          ),
        ]),
      ],
    );
  }
}
