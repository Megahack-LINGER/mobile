import 'package:flutter/material.dart';

class Market extends StatefulWidget {
  @override
  _MarketState createState() => _MarketState();
}

class _MarketState extends State<Market> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Container(
            width: 1000,
            height: 1000,
            padding: EdgeInsets.all(16),
            child: Text("Market")));
  }
}
