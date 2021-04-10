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

class ProductsPage extends StatefulWidget {
  @override
  _ProductsPageState createState() => _ProductsPageState();
}

class _ProductsPageState extends State<ProductsPage> {
  String qrCodeResult = "Not Yet Scanned";
  _ProductsPageState() {
    //Init Alan with sample project id
    AlanVoice.addButton(
      "454e0f61d849e6a9a445b584db0638692e956eca572e1d8b807a3e2338fdd0dc/stage",
      buttonAlign: AlanVoice.BUTTON_ALIGN_LEFT,
    );
  }
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
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 4.0),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ProductDetailPage1()));
                      },
                      child: Container(
                        height: 360,
                        width: getWidth(context) * 0.5,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage('assets/product1.jpeg'),
                                fit: BoxFit.fill)),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 4.0),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ProductDetailPage2()));
                      },
                      child: Container(
                        height: 360,
                        width: getWidth(context) * 0.5,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage('assets/product2.jpeg'),
                                fit: BoxFit.fill)),
                      ),
                    ),
                  ),
                )
              ],
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 4.0),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ProductDetailPage3()));
                    },
                    child: Container(
                      height: 360,
                      width: getWidth(context) * 0.5,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage('assets/product3.jpeg'),
                              fit: BoxFit.fill)),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 4.0),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ProductDetailPage4()));
                    },
                    child: Container(
                      height: 360,
                      width: getWidth(context) * 0.5,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage('assets/product4.jpeg'),
                              fit: BoxFit.fill)),
                    ),
                  ),
                )
              ],
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 4.0, bottom: 4.0),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ProductDetailPage5()));
                    },
                    child: Container(
                      height: 360,
                      width: getWidth(context) * 0.5,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage('assets/product5.jpeg'),
                              fit: BoxFit.fill)),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 4.0),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ProductDetailPage6()));
                    },
                    child: Container(
                      height: 360,
                      width: getWidth(context) * 0.5,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage('assets/product6.jpeg'),
                              fit: BoxFit.fill)),
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
