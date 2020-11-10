import 'package:flutter/material.dart';

class ForgoutPassword extends StatefulWidget {
  @override
  _ForgoutPasswordState createState() => _ForgoutPasswordState();
}

class _ForgoutPasswordState extends State<ForgoutPassword> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.blue,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              child: Align(
                  alignment: Alignment(-1, -0.9),
                  child: IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: Icon(
                        Icons.arrow_back,
                        color: Colors.blue,
                        size: size.width * 0.1,
                      ))),
              width: size.width,
              height: size.height * 0.25,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage(
                          "https://cdn.discordapp.com/attachments/769682105948438601/775427679406391336/unknown.png")),
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(60),
                      bottomRight: Radius.circular(60))),
            ),
          ],
        ),
      ),
    );
  }
}
