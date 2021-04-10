import 'package:flutter/material.dart';
import 'package:my_myntra/main.dart';
import 'package:alan_voice/alan_voice.dart';
import 'package:my_myntra/Screens/SplashScreen/splashScreen.dart';

class ProductDetailPage2 extends StatefulWidget {
  @override
  _ProductDetailPage2State createState() => _ProductDetailPage2State();
}

class _ProductDetailPage2State extends State<ProductDetailPage2> {
  _ProductDetailPage2State() {
    //Init Alan with sample project id
    AlanVoice.addButton(
        "454e0f61d849e6a9a445b584db0638692e956eca572e1d8b807a3e2338fdd0dc/stage",
        buttonAlign: AlanVoice.BUTTON_ALIGN_LEFT);
  }
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
              child: Image.asset("assets/productImage2.jpg"),
            ),
            Container(
              //width: getWidth(context),
              //height: getHeight(context) / 2,
              child: Image.asset("assets/info2.jpg"),
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
                              builder: (context) => SplashScreen(number: 2.0)));
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
