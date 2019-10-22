import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:abhiyantriki/HomeScreen/midscreen.dart';

import 'package:splashscreen/splashscreen.dart' as splash;

// import 'bottom nav.dart';
class SplaashScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return SplaashScreenState();
  }
}

class SplaashScreenState extends State<SplaashScreen> {

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Color(0xff1f1f1f),
      body: Stack(
        children: <Widget>[
          Positioned(
            top: (height - 200) / 2,
            left: (width - 400) / 2,
            child: Center(
              child: Container(
                color: Color(0xff1f1f1f),
                height: 400,
                width: 400,
                child: splash.SplashScreen(
                    seconds:3,
                    navigateAfterSeconds:
                        Mid(),
                    image: new Image.asset(
                      "assets/gg.png",
                      width: 400.0,
                      fit: BoxFit.contain,
                    ),
                    backgroundColor: Color(0xff1f1f1f),
                    styleTextUnderTheLoader: new TextStyle(),
                    photoSize: 100.0,
                    loaderColor: Color(0x00000000)),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
