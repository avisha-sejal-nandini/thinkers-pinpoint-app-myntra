import 'package:flutter/material.dart';
import 'package:my_myntra/main.dart';
import 'package:alan_voice/alan_voice.dart';
import 'package:my_myntra/Screens/Pinpoint/VendorList.dart';

class ProductDetailPage3 extends StatefulWidget {
  @override
  _ProductDetailPage3State createState() => _ProductDetailPage3State();
}

class _ProductDetailPage3State extends State<ProductDetailPage3> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text("DRESSES"),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.search,
              color: Colors.white,
            ),
          ),
          IconButton(
            icon: Icon(
              Icons.favorite_border,
              color: Colors.white,
            ),
          ),
          IconButton(
            icon: Icon(
              Icons.shopping_bag_outlined,
              color: Colors.white,
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              //width: getWidth(context),
              //height: getHeight(context) / 2,
              child: Image.asset("assets/prod3.jpg"),
            ),
            Container(
              //width: getWidth(context),
              //height: getHeight(context) / 2,
              child: Image.asset("assets/info3.jpg"),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40.0),
              child: ButtonTheme(
                minWidth: getWidth(context),
                child: RaisedButton(
                    color: Colors.pink,
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Demo(number: 3.0)));
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.pin_drop_outlined, color: Colors.white),
                        Text(
                          "PinPoint",
                          style: TextStyle(fontSize: 20, color: Colors.white),
                        ),
                      ],
                    )),
              ),
            ),
            Container(
              //width: getWidth(context),
              //height: getHeight(context) ,
              child: Image.asset("assets/detail.jpg"),
            ),
          ],
        ),
      ),
    );
  }
}
