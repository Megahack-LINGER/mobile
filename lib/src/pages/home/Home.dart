//---- Packages
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Container(
        width: 1000,
        height: 1000,
        child: Column(
          children: [
            Container(
                padding: EdgeInsets.all(16),
                width: size.width,
                height: size.height * 0.25,
                decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(40),
                        bottomRight: Radius.circular(40))),
                child: Column(
                  children: [
                    Divider(height: size.height * 0.06, color: Colors.blue),
                    Text(
                      "Linger",
                      style: TextStyle(color: Colors.white, fontSize: 22),
                    ),
                    Divider(height: size.height * 0.06, color: Colors.blue),
                    Container(
                      width: size.width,
                      height: size.height * 0.058,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(30)),
                      child: TextField(
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.all(8),
                            hintText: "Pesquise pelo produto aqui"),
                      ),
                    )
                  ],
                )),
            Divider(),
            Container(
                width: size.width,
                height: size.height * 0.25,
                child: ListView.builder(
                  itemCount: 10,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                        child: Card(
                      elevation: 2,
                      shape: RoundedRectangleBorder(
                          side: BorderSide(color: Colors.white, width: 1),
                          borderRadius: BorderRadius.circular(20)),
                      child: Column(
                        children: [
                          ClipRRect(
                            //Ou circular(20)
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(20),
                                topRight: Radius.circular(20)),
                            child: Image.network(
                              "https://cdn.pixabay.com/photo/2020/07/17/19/22/landscape-5415202_960_720.jpg",
                              height: size.height * 0.14,
                              fit: BoxFit.contain,
                            ),
                          ),
                          Container(
                            width: size.width * 0.43,
                            height: size.height * 0.1,
                            child: ListTile(
                              title: Text("$index"),
                              subtitle: Text("Subittulo: $index"),
                            ),
                          )
                        ],
                      ),
                    ));
                  },
                )),
            Container(
                width: size.width,
                height: size.height * 0.25,
                child: ListView.builder(
                  itemCount: 10,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                        child: Card(
                      shape: RoundedRectangleBorder(
                          side: BorderSide(color: Colors.white, width: 1),
                          borderRadius: BorderRadius.circular(20)),
                      child: Column(
                        children: [
                          ClipRRect(
                            //Ou circular(20)
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(20),
                                topRight: Radius.circular(20)),
                            child: Image.network(
                              "https://cdn.pixabay.com/photo/2020/07/17/19/22/landscape-5415202_960_720.jpg",
                              height: size.height * 0.14,
                            ),
                          ),
                          Container(
                            width: size.width * 0.43,
                            height: size.height * 0.1,
                            child: ListTile(
                              title: Text("$index"),
                              subtitle: Text("Subittulo: $index"),
                            ),
                          )
                        ],
                      ),
                    ));
                  },
                )),
          ],
        ),
      ),
    );
  }
}
