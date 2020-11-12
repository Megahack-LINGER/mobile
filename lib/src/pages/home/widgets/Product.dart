import 'package:flutter/material.dart';

class Product extends StatefulWidget {
  Product({Key key, this.dataProduct}) : super(key: key);
  final Map dataProduct;
  @override
  _ProductState createState() => _ProductState();
}

class _ProductState extends State<Product> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        body: SingleChildScrollView(
      child: Container(
        width: size.width,
        height: size.height,
        padding: EdgeInsets.all(16),
        child: Column(
          children: [Text("${widget.dataProduct["title"]}")],
        ),
      ),
    ));
  }
}
