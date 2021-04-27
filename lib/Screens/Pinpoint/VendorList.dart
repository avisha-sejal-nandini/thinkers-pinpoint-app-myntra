import 'dart:async';
import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:mongo_dart/mongo_dart.dart';
import 'package:flutter/material.dart';
import 'package:my_myntra/Screens/Pinpoint/Map/mapIndividual.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:my_myntra/Screens/Pinpoint/Map/AllMap.dart';
import 'package:my_myntra/main.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:provider/provider.dart';
import 'package:my_myntra/Screens/Pinpoint/Map/location.dart';
import 'package:my_myntra/Screens/Pinpoint/Map/nearstStore.dart';
import 'package:geolocator/geolocator.dart';

var temp = 0;

class Demo extends StatelessWidget {
  double number;
  Demo({this.number});
  List Name = [];
  Future getInfo() async {
    Db db = await Db.create(
        "mongodb+srv://thinkers321:thinkers321@cluster0.2zy1o.mongodb.net/googlesheetsdb?retryWrites=true&w=majority");
    await db.open();
    print('DB Connected');
    DbCollection coll = db.collection('thinkers_productdetail');
    //print(coll);
    var response = await coll.find();
    double min = 0;
    await response.forEach((element) {
      if (element['productId'] == "$number") Name.add(element);
      if (element['availability'] == "No") temp = 1;
      /*Name.add(element['name'])*/
    });
    print(Name);
    //print(response);
    await db.close();
    /*List<String> r=[response['productId'],response['name'],response['address'],response['pincode'],response['city']
      ,response['state'],response['availability'],response['changingroom']] ;
    return r;*/
    return Name;
  }

  SpeedDial buildSpeedDial(BuildContext context) {
    return SpeedDial(
      /// both default to 16
      marginEnd: 18,
      marginBottom: 20,
      // animatedIcon: AnimatedIcons.menu_close,
      // animatedIconTheme: IconThemeData(size: 22.0),
      /// This is ignored if animatedIcon is non null
      icon: Icons.add,
      activeIcon: Icons.remove,
      // iconTheme: IconThemeData(color: Colors.grey[50], size: 30),

      /// The label of the main button.
      // label: Text("Open Speed Dial"),
      /// The active label of the main button, Defaults to label if not specified.
      // activeLabel: Text("Close Speed Dial"),
      /// Transition Builder between label and activeLabel, defaults to FadeTransition.
      // labelTransitionBuilder: (widget, animation) => ScaleTransition(scale: animation,child: widget),
      /// The below button size defaults to 56 itself, its the FAB size + It also affects relative padding and other elements
      buttonSize: 56.0,
      visible: true,

      /// If true user is forced to close dial manually
      /// by tapping main button and overlay is not rendered.
      closeManually: false,
      curve: Curves.bounceIn,
      overlayColor: Colors.black,
      overlayOpacity: 0.5,
      onOpen: () => print('OPENING DIAL'),
      onClose: () => print('DIAL CLOSED'),
      tooltip: 'Speed Dial',
      heroTag: 'speed-dial-hero-tag',
      backgroundColor: Colors.white,
      foregroundColor: Colors.black,
      elevation: 8.0,
      shape: CircleBorder(),

      // orientation: SpeedDialOrientation.Up,
      // childMarginBottom: 2,
      // childMarginTop: 2,
      gradientBoxShape: BoxShape.circle,
      gradient: LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [Colors.black, Colors.white],
      ),
      children: [
        SpeedDialChild(
            child: Icon(Icons.map_outlined),
            backgroundColor: Colors.red,
            label: 'All Stores🗺️',
            labelStyle: TextStyle(fontSize: 18.0, color: Colors.red),
            onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => AllMaps(
                            lists: Name,
                          )),
                )),
        SpeedDialChild(
            child: Icon(Icons.map),
            backgroundColor: Colors.blue,
            label: 'Nearest Stores🗺️',
            labelStyle: TextStyle(fontSize: 18.0, color: Colors.red),
            onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => MinMap(
                            list: Name,
                          )),
                )),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> done = [];
    final geoService = LocationService();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: AutoSizeText(
          "STORES",
          textAlign: TextAlign.start,
          style: TextStyle(
            fontFamily: 'Anton',
            letterSpacing: 1.3,
            fontWeight: FontWeight.w800,
            color: Colors.white,
          ),
        ),
      ),
      backgroundColor: Colors.white,
      body: FutureProvider(
        create: (context) => geoService.getInitialPosition(),
        child: Consumer<Position>(builder: (context, position, widget) {
          return FutureBuilder(
              future: getInfo(),
              builder: (buildContext, AsyncSnapshot snapshot) {
                if (snapshot.hasError)
                  throw snapshot.error;
                else if (!snapshot.hasData || position == null) {
                  return Scaffold(
                    backgroundColor: Colors.white,
                    body: InkWell(
                      child: Stack(
                        fit: StackFit.expand,
                        children: <Widget>[
                          Container(
                            child: Center(
                              child: Image.asset(
                                'assets/splashScreen.jpeg',
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                } else {
                  print(snapshot.data.length);

                  for (int i = 0; i < snapshot.data.length; i++) {
                    print(i);

                    double dist;
                    double time;
                    dist = Geolocator.distanceBetween(
                        position.latitude,
                        position.longitude,
                        double.parse(snapshot.data[i]['latitude']),
                        double.parse(snapshot.data[i]['longitude']));
                    print("ppppppppppppppp");
                    dist = dist / 1000;
                    print(dist);
                    time = dist * 0.2;
                    print("jhnfhndhcndgcngbdx");
                    print(i);
                    done.add(GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => MyMap(
                                    l1: LatLng(
                                        double.parse(
                                            "${snapshot.data[i]['latitude']}"),
                                        double.parse(
                                            "${snapshot.data[i]['longitude']}")))));
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 1.5, vertical: 14.0),
                        child: Container(
                            decoration: new BoxDecoration(
                              //border: Border.symmetric()
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(8.0),
                              boxShadow: <BoxShadow>[
                                BoxShadow(
                                  color: Colors.grey,
                                  blurRadius: 3,
                                  offset: Offset(10, 10),
                                ),
                              ],
                            ),
                            height: 188,
                            child: Column(
                              children: [
                                Row(children: [
                                  Padding(
                                    padding: const EdgeInsets.only(left: 4.0),
                                    child: CircleAvatar(
                                      radius: 48.0,
                                      backgroundColor: Colors.black,
                                      backgroundImage:
                                          AssetImage('assets/clothes.jpg'),
                                    ),
                                  ),
                                  Expanded(
                                      child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(top: 9.0),
                                          child: Text(
                                            '${snapshot.data[i]['name']} '
                                                .toUpperCase(),
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                letterSpacing: 1.2,
                                                fontFamily: 'Teko',
                                                fontWeight: FontWeight.w700,
                                                color: Colors.black,
                                                backgroundColor: Colors.white60,
                                                fontSize: 18.0),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 5.0,
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              right: 15.0, left: 7.0),
                                          child: AutoSizeText(
                                            '📍 ${snapshot.data[i]['address']}',
                                            minFontSize: 5.0,
                                            maxLines: 3,
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                fontFamily: 'Amiri',
                                                fontWeight: FontWeight.w600,
                                                color: Colors.black87,
                                                fontSize: 14.0),
                                          ),
                                        ),
                                      ]))
                                ]),
                                SizedBox(
                                  height: 6.0,
                                ),
                                Row(children: [
                                  Expanded(
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          right: 2.0, left: 2.5),
                                      child: GestureDetector(
                                        onTap: () {
                                          if ('${snapshot.data[i]['availability']}' ==
                                                  "No" ||
                                              '${snapshot.data[i]['availability']}' ==
                                                  "No ") {
                                            _notificationAlert(context);
                                          }
                                        },
                                        child: Container(
                                          height: 37.0,
                                          decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius:
                                                  BorderRadius.circular(4.0),
                                              border: Border.all(
                                                  color: Colors.grey,
                                                  width: 0.8)),
                                          child: Center(
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                AutoSizeText(
                                                  'Avaliability:',
                                                  minFontSize: 6.0,
                                                  textAlign: TextAlign.center,
                                                  style: TextStyle(
                                                      fontFamily:
                                                          'LondrinaSolid',
                                                      color: Colors.black,
                                                      fontSize: 11.0),
                                                ),
                                                AutoSizeText(
                                                  '${snapshot.data[i]['availability']}',
                                                  textAlign: TextAlign.center,
                                                  minFontSize: 6.0,
                                                  style: TextStyle(
                                                    fontFamily: 'LondrinaSolid',
                                                    color: snapshot.data[i][
                                                                'availability'] ==
                                                            "Yes"
                                                        ? Colors.green
                                                        : Colors.red,
                                                    fontSize: 11.0,
                                                    fontWeight: FontWeight.w800,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: Container(
                                      height: 37.0,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(4.0),
                                          color: Colors.white,
                                          border: Border.all(
                                              width: 0.8, color: Colors.grey)),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          AutoSizeText(
                                            'Changing Room:',
                                            minFontSize: 6.0,
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                fontFamily: 'LondrinaSolid',
                                                color: Colors.black,
                                                fontSize: 11.0),
                                          ),
                                          AutoSizeText(
                                            '${snapshot.data[i]['changingroom']}',
                                            textAlign: TextAlign.center,
                                            minFontSize: 6.0,
                                            style: TextStyle(
                                              fontFamily: 'LondrinaSolid',
                                              fontSize: 11.0,
                                              fontWeight: FontWeight.w800,
                                              color: snapshot.data[i]
                                                          ['changingroom'] ==
                                                      "Yes"
                                                  ? Colors.green
                                                  : Colors.red,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          right: 1.5, left: 2.0),
                                      child: Container(
                                        height: 37.0,
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius:
                                                BorderRadius.circular(4.0),
                                            border: Border.all(
                                                color: Colors.grey,
                                                width: 0.8)),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            AutoSizeText(
                                              'Distance',
                                              minFontSize: 6.0,
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                  fontFamily: 'LondrinaSolid',
                                                  color: Colors.black,
                                                  fontSize: 11.0),
                                            ),
                                            AutoSizeText(
                                              '${dist.toStringAsFixed(2)} km',
                                              textAlign: TextAlign.center,
                                              minFontSize: 6.0,
                                              style: TextStyle(
                                                  fontFamily: 'LondrinaSolid',
                                                  fontSize: 11.0,
                                                  fontWeight: FontWeight.w800,
                                                  color: Colors.orange),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ]),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 112, vertical: 3.0),
                                  child: Container(
                                    height: 22.0,
                                    decoration: BoxDecoration(
                                        color: Colors.grey[300],
                                        border: Border.all(
                                            color: Colors.grey, width: 1.0)),
                                    child: Padding(
                                      padding: const EdgeInsets.all(2.0),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          AutoSizeText(
                                            'Time:',
                                            textAlign: TextAlign.center,
                                            minFontSize: 6.0,
                                            style: TextStyle(
                                                fontFamily: 'LondrinaSolid',
                                                color: Colors.black,
                                                fontSize: 11.0),
                                          ),
                                          AutoSizeText(
                                            '${time.toStringAsFixed(2)} hrs',
                                            textAlign: TextAlign.center,
                                            minFontSize: 6.0,
                                            style: TextStyle(
                                              fontFamily: 'LondrinaSolid',
                                              color: Colors.black87,
                                              fontSize: 11.0,
                                              fontWeight: FontWeight.w800,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            )),
                      ),
                    ));
                  }
                }

                return SafeArea(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 4.0, horizontal: 2.0),
                    child: ListView(
                      children: done,
                    ),
                  ),
                );
              });
        }),
      ),
      floatingActionButton: buildSpeedDial(context),
    );
  }

  _notificationAlert(context) {
    Alert(
      context: context,
      type: AlertType.success,
      title: "Notify me",
      desc: "Notify me when the product is available.",
      //image: Center(child: Image.asset("assets/notify.png")),
      buttons: [
        DialogButton(
          child: Text(
            "Notify me",
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          onPressed: () => Navigator.pop(context),
          gradient: LinearGradient(colors: [
            Color.fromRGBO(116, 116, 191, 1.0),
            Color.fromRGBO(52, 138, 199, 1.0)
          ]),
        )
      ],
    ).show();
  }
}
