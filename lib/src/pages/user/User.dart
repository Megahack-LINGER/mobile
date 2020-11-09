import 'package:flutter/material.dart';

class User extends StatefulWidget {
  @override
  _UserState createState() => _UserState();
}

class _UserState extends State<User> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
          width: 1000,
          height: 1000,
          padding: EdgeInsets.all(16),
          child: Text("User")),
    );
  }
}
