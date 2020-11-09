//---- Packages
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:linger/src/Nav.dart';

//---- Screens
import 'package:linger/src/onboarding/widgets/subPage.dart';

class Onboarding extends StatefulWidget {
  @override
  _OnboardingState createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.blue[300],
        body: SingleChildScrollView(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              padding: EdgeInsets.only(
                top: 250,
              ),
              width: 1000,
              height: 700,
              child: PageView(
                children: [
                  subPage(
                      "https://cdn.pixabay.com/photo/2020/08/25/18/28/workplace-5517744__340.jpg",
                      "tela 1"),
                  subPage(
                      "https://cdn.pixabay.com/photo/2020/08/25/18/28/workplace-5517744__340.jpg",
                      "tela 2"),
                  subPage(
                      "https://cdn.pixabay.com/photo/2020/08/25/18/28/workplace-5517744__340.jpg",
                      "tela 3"),
                  subPage(
                      "https://cdn.pixabay.com/photo/2020/08/25/18/28/workplace-5517744__340.jpg",
                      "tela 4")
                ],
              ),
            ),
            ClipRRect(
                borderRadius: BorderRadius.circular(40),
                child: Container(
                    width: 140,
                    height: 40,
                    child: RaisedButton.icon(
                        color: Colors.white,
                        onPressed: () {
                          Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(builder: (context) => Nav()),
                              (route) => false);
                        },
                        icon: Icon(
                          Icons.check,
                          color: Colors.blue,
                        ),
                        label: Text("Ir"))))
          ],
        )));
  }
}
