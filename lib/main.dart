//---- Packages
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:simple_splashscreen/simple_splashscreen.dart';
import 'package:path_provider/path_provider.dart';
import 'package:firebase_core/firebase_core.dart';

//---- Screens
import 'package:linger/src/onboarding/Onboarding.dart';
import 'package:linger/src/Nav.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MaterialApp(
    title: "Linger",
    theme: ThemeData(primarySwatch: Colors.blue),
    home: SplashScreen(),
  ));
}

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Map boarding = {"email": false};
  Future<File> getData() async {
    final file = await getApplicationDocumentsDirectory();
    return File(file.path);
  }

  _readData() async {
    try {
      final data = await getData();
      print(data.readAsStringSync());
      setState(() {
        boarding["email"] = true;
      });
    } catch (e) {
      setState(() {
        boarding["email"] = false;
      });
    }
  }

  @override
  void initState() {
    _readData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Simple_splashscreen(
      context: context,
      splashscreenWidget: Splash(),
      gotoWidget: boarding["email"] == true ? Nav() : Onboarding(),
      timerInSeconds: 2,
    );
  }
}

class Splash extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.network(
                "https://cdn.discordapp.com/attachments/769682105948438601/775427679406391336/unknown.png"),
            Text("A ferramenta do momento ideial",
                style: TextStyle(fontSize: 22))
          ],
        )));
  }
}
