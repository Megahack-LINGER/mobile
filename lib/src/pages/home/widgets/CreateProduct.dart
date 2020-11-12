import 'package:flutter/material.dart';

class CreateProduct extends StatefulWidget {
  @override
  _CreateProductState createState() => _CreateProductState();
}

class _CreateProductState extends State<CreateProduct> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        body: Container(
      padding: EdgeInsets.all(16),
      width: size.width,
      height: size.height,
      child: SingleChildScrollView(
        child: Column(
          children: [Text("Eae")],
        ),
      ),
    ));
  }
}
