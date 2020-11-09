//---- Packages
import 'package:flutter/material.dart';

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
        body: SingleChildScrollView(
            child: Column(
      children: [
        Container(
          padding: EdgeInsets.all(16),
          width: 1000,
          height: 1000,
          child: PageView(children: [
            subPage("assets/images/logoAgricultura.png", "tela 1"),
            subPage("assets/images/logoAgricultura.png", "tela 2")
          ]),
        ),
      ],
    )));
  }
}
