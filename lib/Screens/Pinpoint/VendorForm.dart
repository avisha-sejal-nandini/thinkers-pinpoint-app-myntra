import 'package:flutter/material.dart';
import 'package:my_myntra/Screens/Products/Product.dart';

class ActivatePinpoint extends StatefulWidget {
  @override
  _ActivatePinpointState createState() => _ActivatePinpointState();
}

class _ActivatePinpointState extends State<ActivatePinpoint> {
  @override
  Widget build(BuildContext context) {
    Widget Form = Center(
      child: Text(
        'Pinpoint Activation',
        textAlign: TextAlign.center,
        style: TextStyle(
            color: Colors.white,
            fontSize: 34.0,
            fontWeight: FontWeight.bold,
            shadows: [
              BoxShadow(
                color: Color.fromRGBO(0, 0, 0, 0.15),
                offset: Offset(0, 5),
                blurRadius: 10.0,
              )
            ]),
      ),
    );

    Widget subTitle = Padding(
        padding: const EdgeInsets.only(right: 56.0),
        child: Text(
          'Fill the form to activate Pinpoint for your selected product(s)',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.white,
            fontSize: 16.0,
          ),
        ));

    Widget activation = InkWell(
      onTap: () {
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (_) => ProductsPage()));
      },
      child: Center(
        child: Container(
          width: MediaQuery.of(context).size.width / 3,
          height: 70,
          child: Center(
              child: new Text("Activate",
                  style: const TextStyle(
                      color: const Color(0xfffefefe),
                      fontWeight: FontWeight.w600,
                      fontStyle: FontStyle.normal,
                      fontSize: 20.0))),
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: [
                    Color.fromRGBO(236, 60, 3, 1),
                    Color.fromRGBO(234, 60, 3, 1),
                    Color.fromRGBO(216, 78, 16, 1),
                  ],
                  begin: FractionalOffset.topCenter,
                  end: FractionalOffset.bottomCenter),
              boxShadow: [
                BoxShadow(
                  color: Color.fromRGBO(0, 0, 0, 0.16),
                  offset: Offset(0, 5),
                  blurRadius: 10.0,
                )
              ],
              borderRadius: BorderRadius.circular(9.0)),
        ),
      ),
    );
    Widget activationForm = SingleChildScrollView(
      child: Container(
        margin: EdgeInsets.only(right: 30.0),
        height: MediaQuery.of(context).size.height / 1.8,
        child: Stack(
          children: <Widget>[
            Container(
              height: MediaQuery.of(context).size.height / 2,
              width: MediaQuery.of(context).size.width,
              padding: const EdgeInsets.only(left: 32.0, right: 32.0),
              decoration: BoxDecoration(
                  color: Color.fromRGBO(255, 255, 255, 0.8),
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                      bottomLeft: Radius.circular(10))),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: TextField(
                        decoration: new InputDecoration(
                          hintText: "Product Id",
                        ),
                        style: TextStyle(fontSize: 16.0),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: TextField(
                        decoration: new InputDecoration(
                          hintText: "Name",
                        ),
                        style: TextStyle(fontSize: 16.0),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: TextField(
                        decoration: new InputDecoration(
                          hintText: "Address",
                        ),
                        style: TextStyle(fontSize: 16.0),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: TextField(
                        decoration: new InputDecoration(
                          hintText: "Pincode",
                        ),
                        style: TextStyle(fontSize: 16.0),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: TextField(
                        decoration: new InputDecoration(
                          hintText: "City",
                        ),
                        style: TextStyle(fontSize: 16.0),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: TextField(
                        decoration: new InputDecoration(
                          hintText: "State",
                        ),
                        style: TextStyle(fontSize: 16.0),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: TextField(
                        decoration: new InputDecoration(
                          hintText: "Availability Status",
                        ),
                        style: TextStyle(fontSize: 16.0),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: TextField(
                        decoration: new InputDecoration(
                          hintText: "Changing Room Status",
                        ),
                        style: TextStyle(fontSize: 16.0),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );

    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/background.jpg'),
                    fit: BoxFit.cover)),
          ),
          Container(
            decoration: BoxDecoration(
              color: Color.fromRGBO(253, 184, 70, 0.7),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 28.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Spacer(flex: 3),
                SingleChildScrollView(child: Form),
                Spacer(),
                subTitle,
                Spacer(flex: 2),
                Center(child: activationForm),
                Spacer(flex: 2),
                activation,
              ],
            ),
          )
        ],
      ),
    );
  }
}
