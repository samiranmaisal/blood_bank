import 'dart:async';
import 'package:flutter/material.dart';
import 'home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bllod Bank App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SplashScreen(),
    );
  }
}



class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}
class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
        Duration(seconds: 3),
            () => Navigator.of(context).pushReplacement(_createRoute()));
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body:
      Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/splash.gif"),
            fit: BoxFit.cover,
          ),
        ),
        child: null /* add child content here */,
      ),
      // Container(
      //   decoration: BoxDecoration(image:
      //   DecorationImage(image: AssetImage("assets/images/gif3.gif"),fit: BoxFit.contain)
      //   ),
      //
      // )

    );
  }
}


Route _createRoute() {

  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => home(),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      return child;
    },
  );

}


