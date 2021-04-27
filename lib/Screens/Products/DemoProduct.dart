import 'package:flutter/material.dart';
import 'package:my_myntra/Screens/Pinpoint/VendorForm.dart';
import 'package:my_myntra/main.dart';
import 'package:my_myntra/Screens/Products/ProductDetail1.dart';
import 'package:my_myntra/Screens/Products/ProductDetail2.dart';
import 'package:my_myntra/Screens/Products/ProductDetail3.dart';
import 'package:my_myntra/Screens/Products/ProductDetail4.dart';
import 'package:alan_voice/alan_voice.dart';
import 'package:my_myntra/Screens/Products/ProductDetail5.dart';
import 'package:my_myntra/Screens/Products/ProductDetail6.dart';
import 'package:path_provider/path_provider.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:barcode_scan_fix/barcode_scan.dart';
//import 'DemoProDet1.dart';

class DemoProductsPage extends StatefulWidget {
  @override
  _DemoProductsPageState createState() => _DemoProductsPageState();
}

class _DemoProductsPageState extends State<DemoProductsPage> {
  String qrCodeResult = "Not Yet Scanned";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: Colors.white,
        /*actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: Colors.white,
            ),
          )
        ],*/
        title: Text(
          "DRESSES",
          style: TextStyle(color: Colors.black),
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.search,
              color: Colors.black,
            ),
          ),
          IconButton(
            icon: Icon(
              Icons.favorite_border,
              color: Colors.black,
            ),
          ),
          IconButton(
            icon: Icon(
              Icons.shopping_bag_outlined,
              color: Colors.black,
            ),
          )
        ],
      ),
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            ListTile(
              title: Text("I'm Vendor"),
              trailing: Icon(Icons.app_registration),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ActivatePinpoint()));
              },
            ),
            ListTile(
              title: Text("Scan QR Code"),
              trailing: Icon(Icons.qr_code_scanner_outlined),
              onTap: () async {
                String codeSanner =
                    await BarcodeScanner.scan(); //barcode scnner
                setState(() {
                  qrCodeResult = codeSanner;
                });
                if (qrCodeResult == '1') {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ProductDetailPage1()));
                }
                ;
                if (qrCodeResult == '2') {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ProductDetailPage2()));
                }
                ;
                if (qrCodeResult == '3') {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ProductDetailPage3()));
                }
                ;
                if (qrCodeResult == '4') {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ProductDetailPage4()));
                }
                ;
                if (qrCodeResult == '5') {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ProductDetailPage5()));
                }
                ;
                if (qrCodeResult == '6') {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ProductDetailPage6()));
                }
                ;
              },
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ProductDetailPage1()));
                    },
                    child: Column(
                      children: [
                        Container(
                          height: 280,
                          width: getWidth(context) * 0.5,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage('assets/prod1.jpg'),
                                  fit: BoxFit.fill)),
                        ),
                        Container(
                          height: 68.0,
                          color: Colors.grey[200],
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                  child: Padding(
                                padding: const EdgeInsets.only(left: 10.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Allen Solly Women",
                                      textAlign: TextAlign.start,
                                      style: TextStyle(
                                          fontFamily: 'Teko',
                                          fontSize: 13.0,
                                          color: Colors.black),
                                    ),
                                    Text(
                                      "Women formal wear",
                                      style: TextStyle(
                                        fontFamily: 'Teko',
                                        fontSize: 10.0,
                                        color: Colors.grey[600],
                                      ),
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          "₹974  ",
                                          style: TextStyle(
                                              fontFamily: 'Teko',
                                              fontSize: 13.0,
                                              color: Colors.black),
                                        ),
                                        Text(
                                          " ₹1,240  ",
                                          style: TextStyle(
                                            fontFamily: 'Teko',
                                            fontSize: 12.0,
                                            decoration:
                                                TextDecoration.lineThrough,
                                            color: Colors.grey[600],
                                          ),
                                        ),
                                        Text(
                                          " 61% OFF",
                                          style: TextStyle(
                                            fontFamily: 'Teko',
                                            fontSize: 12.0,
                                            color: Colors.red,
                                          ),
                                        )
                                      ],
                                    )
                                  ],
                                ),
                              )),
                              Padding(
                                padding: const EdgeInsets.only(right: 8.0),
                                child: Text(
                                  "♡",
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 15),
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  width: 1.0,
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ProductDetailPage2()));
                    },
                    child: Column(
                      children: [
                        Container(
                          height: 280,
                          width: getWidth(context) * 0.5,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage('assets/prod2.jpg'),
                                  fit: BoxFit.fill)),
                        ),
                        Container(
                          height: 68.0,
                          color: Colors.grey[200],
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                  child: Padding(
                                padding: const EdgeInsets.only(left: 10.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Raymond",
                                      textAlign: TextAlign.start,
                                      style: TextStyle(
                                          fontFamily: 'Teko',
                                          fontSize: 13.0,
                                          color: Colors.black),
                                    ),
                                    Text(
                                      "Men Solid Suit",
                                      style: TextStyle(
                                        fontFamily: 'Teko',
                                        fontSize: 10.0,
                                        color: Colors.grey[600],
                                      ),
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          "₹5,399 ",
                                          style: TextStyle(
                                              fontFamily: 'Teko',
                                              fontSize: 13.0,
                                              color: Colors.black),
                                        ),
                                        Text(
                                          " ₹11,240  ",
                                          style: TextStyle(
                                            fontFamily: 'Teko',
                                            fontSize: 12.0,
                                            decoration:
                                                TextDecoration.lineThrough,
                                            color: Colors.grey[600],
                                          ),
                                        ),
                                        Text(
                                          " 55% OFF",
                                          style: TextStyle(
                                            fontFamily: 'Teko',
                                            fontSize: 12.0,
                                            color: Colors.red,
                                          ),
                                        )
                                      ],
                                    )
                                  ],
                                ),
                              )),
                              Padding(
                                padding: const EdgeInsets.only(right: 8.0),
                                child: Text(
                                  "♡",
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 15),
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
            SizedBox(
              height: 1.0,
            ),
            Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ProductDetailPage3()));
                    },
                    child: Column(
                      children: [
                        Container(
                          height: 280,
                          width: getWidth(context) * 0.5,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage('assets/prod3.jpg'),
                                  fit: BoxFit.fill)),
                        ),
                        Container(
                          height: 68.0,
                          color: Colors.grey[200],
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                  child: Padding(
                                padding: const EdgeInsets.only(left: 10.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Tokyo Talkies",
                                      textAlign: TextAlign.start,
                                      style: TextStyle(
                                          fontFamily: 'Teko',
                                          fontSize: 13.0,
                                          color: Colors.black),
                                    ),
                                    Text(
                                      "Solid Sheath Dress",
                                      style: TextStyle(
                                        fontFamily: 'Teko',
                                        fontSize: 10.0,
                                        color: Colors.grey[600],
                                      ),
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          "₹519  ",
                                          style: TextStyle(
                                              fontFamily: 'Teko',
                                              fontSize: 13.0,
                                              color: Colors.black),
                                        ),
                                        Text(
                                          " ₹1,240  ",
                                          style: TextStyle(
                                            fontFamily: 'Teko',
                                            fontSize: 12.0,
                                            decoration:
                                                TextDecoration.lineThrough,
                                            color: Colors.grey[600],
                                          ),
                                        ),
                                        Text(
                                          " 60% OFF",
                                          style: TextStyle(
                                            fontFamily: 'Teko',
                                            fontSize: 12.0,
                                            color: Colors.red,
                                          ),
                                        )
                                      ],
                                    )
                                  ],
                                ),
                              )),
                              Padding(
                                padding: const EdgeInsets.only(right: 8.0),
                                child: Text(
                                  "♡",
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 15),
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  width: 1.0,
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ProductDetailPage4()));
                    },
                    child: Column(
                      children: [
                        Container(
                          height: 280,
                          width: getWidth(context) * 0.5,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage('assets/prod4.jpg'),
                                  fit: BoxFit.fill)),
                        ),
                        Container(
                          height: 68.0,
                          color: Colors.grey[200],
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                  child: Padding(
                                padding: const EdgeInsets.only(left: 10.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text(
                                      "MANGO",
                                      textAlign: TextAlign.start,
                                      style: TextStyle(
                                          fontFamily: 'Teko',
                                          fontSize: 13.0,
                                          color: Colors.black),
                                    ),
                                    Text(
                                      "Textured A-Line Dress",
                                      style: TextStyle(
                                        fontFamily: 'Teko',
                                        fontSize: 10.0,
                                        color: Colors.grey[600],
                                      ),
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          "₹3,231  ",
                                          style: TextStyle(
                                              fontFamily: 'Teko',
                                              fontSize: 13.0,
                                              color: Colors.black),
                                        ),
                                        Text(
                                          " ₹3,590  ",
                                          style: TextStyle(
                                            fontFamily: 'Teko',
                                            fontSize: 12.0,
                                            decoration:
                                                TextDecoration.lineThrough,
                                            color: Colors.grey[600],
                                          ),
                                        ),
                                        Text(
                                          " 10% OFF",
                                          style: TextStyle(
                                            fontFamily: 'Teko',
                                            fontSize: 12.0,
                                            color: Colors.red,
                                          ),
                                        )
                                      ],
                                    )
                                  ],
                                ),
                              )),
                              Padding(
                                padding: const EdgeInsets.only(right: 8.0),
                                child: Text(
                                  "♡",
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 15),
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
            SizedBox(
              height: 1.0,
            ),
            Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ProductDetailPage5()));
                    },
                    child: Column(
                      children: [
                        Container(
                          height: 280,
                          width: getWidth(context) * 0.5,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage('assets/prod5.jpg'),
                                  fit: BoxFit.fill)),
                        ),
                        Container(
                          height: 68.0,
                          color: Colors.grey[200],
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                  child: Padding(
                                padding: const EdgeInsets.only(left: 10.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text(
                                      "H&M",
                                      textAlign: TextAlign.start,
                                      style: TextStyle(
                                          fontFamily: 'Teko',
                                          fontSize: 13.0,
                                          color: Colors.black),
                                    ),
                                    Text(
                                      "Track Suit",
                                      style: TextStyle(
                                        fontFamily: 'Teko',
                                        fontSize: 10.0,
                                        color: Colors.grey[600],
                                      ),
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          "₹1800  ",
                                          style: TextStyle(
                                              fontFamily: 'Teko',
                                              fontSize: 13.0,
                                              color: Colors.black),
                                        ),
                                        Text(
                                          " ₹1,900  ",
                                          style: TextStyle(
                                            fontFamily: 'Teko',
                                            fontSize: 12.0,
                                            decoration:
                                                TextDecoration.lineThrough,
                                            color: Colors.grey[600],
                                          ),
                                        ),
                                        Text(
                                          " 10% OFF",
                                          style: TextStyle(
                                            fontFamily: 'Teko',
                                            fontSize: 12.0,
                                            color: Colors.red,
                                          ),
                                        )
                                      ],
                                    )
                                  ],
                                ),
                              )),
                              Padding(
                                padding: const EdgeInsets.only(right: 8.0),
                                child: Text(
                                  "♡",
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 15),
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  width: 1.0,
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ProductDetailPage6()));
                    },
                    child: Column(
                      children: [
                        Container(
                          height: 280,
                          width: getWidth(context) * 0.5,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage('assets/prod6.jpg'),
                                  fit: BoxFit.fill)),
                        ),
                        Container(
                          height: 68.0,
                          color: Colors.grey[200],
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                  child: Padding(
                                padding: const EdgeInsets.only(left: 10.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Bitiya by Bhama",
                                      textAlign: TextAlign.start,
                                      style: TextStyle(
                                          fontFamily: 'Teko',
                                          fontSize: 13.0,
                                          color: Colors.black),
                                    ),
                                    Text(
                                      "Girls Playsuit",
                                      style: TextStyle(
                                        fontFamily: 'Teko',
                                        fontSize: 10.0,
                                        color: Colors.grey[600],
                                      ),
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          "₹999  ",
                                          style: TextStyle(
                                              fontFamily: 'Teko',
                                              fontSize: 13.0,
                                              color: Colors.black),
                                        ),
                                        Text(
                                          " ₹1,240  ",
                                          style: TextStyle(
                                            fontFamily: 'Teko',
                                            fontSize: 12.0,
                                            decoration:
                                                TextDecoration.lineThrough,
                                            color: Colors.grey[600],
                                          ),
                                        ),
                                        Text(
                                          " 61% OFF",
                                          style: TextStyle(
                                            fontFamily: 'Teko',
                                            fontSize: 12.0,
                                            color: Colors.red,
                                          ),
                                        )
                                      ],
                                    )
                                  ],
                                ),
                              )),
                              Padding(
                                padding: const EdgeInsets.only(right: 8.0),
                                child: Text(
                                  "♡",
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 15),
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
