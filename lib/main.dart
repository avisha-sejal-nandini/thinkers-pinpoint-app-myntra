import 'package:flutter/material.dart';
import 'package:my_myntra/Screens/Products/Product.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'PinPoint',
        home: ProductsPage());
  }
}

Widget sbh(double h) {
  return SizedBox(
    height: h,
  );
}

Widget sbw(double b) {
  return SizedBox(
    width: b,
  );
}

double getWidth(BuildContext context) {
  return MediaQuery.of(context).size.width;
}

double getHeight(BuildContext context) {
  return MediaQuery.of(context).size.height;
}
