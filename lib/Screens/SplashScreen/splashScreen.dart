import 'dart:async';
import 'package:flutter/material.dart';
import 'package:my_myntra/Screens/Pinpoint/VendorList.dart';

class SplashScreen extends StatefulWidget {
  double number;
  SplashScreen({this.number});
  final Color backgroundColor = Colors.white;
  final TextStyle styleTextUnderTheLoader = TextStyle(
      fontSize: 18.0, fontWeight: FontWeight.bold, color: Colors.black);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final splashDelay = 5;

  @override
  void initState() {
    super.initState();

    _loadWidget();
  }

  _loadWidget() async {
    var _duration = Duration(seconds: splashDelay);
    return Timer(_duration, navigationPage);
  }

  void navigationPage() {
    Navigator.pushReplacement(
        context,
        MaterialPageRoute(
            builder: (BuildContext context) => Demo(number: widget.number)));
  }

  @override
  Widget build(BuildContext context) {
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
  }
}
