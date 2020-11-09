//---- Packages
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        width: 1000,
        height: 1000,
        padding: EdgeInsets.all(8),
        child: Column(
          children: [
            Expanded(
                child: ListView.builder(
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
                          height: 120,
                        ),
                      ),
                      Container(
                        width: 180,
                        height: 50,
                        child: ListTile(
                          title: Text("$index"),
                          subtitle: Text("Subittulo: $index"),
                        ),
                      )
                    ],
                  ),
                ));
              },
              itemCount: 10,
              scrollDirection: Axis.horizontal,
            )),
            Expanded(
                child: ListView.builder(
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
                          height: 120,
                        ),
                      ),
                      Container(
                        width: 180,
                        height: 50,
                        child: ListTile(
                          title: Text("$index"),
                          subtitle: Text("Subittulo: $index"),
                        ),
                      )
                    ],
                  ),
                ));
              },
              itemCount: 10,
              scrollDirection: Axis.horizontal,
            )),
            Expanded(
                child: ListView.builder(
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
                          height: 120,
                        ),
                      ),
                      Container(
                        width: 180,
                        height: 50,
                        child: ListTile(
                          title: Text("$index"),
                          subtitle: Text("Subittulo: $index"),
                        ),
                      )
                    ],
                  ),
                ));
              },
              itemCount: 10,
              scrollDirection: Axis.horizontal,
            )),
            Expanded(
                child: ListView.builder(
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
                          height: 120,
                        ),
                      ),
                      Container(
                        width: 180,
                        height: 50,
                        child: ListTile(
                          title: Text("$index"),
                          subtitle: Text("Subittulo: $index"),
                        ),
                      )
                    ],
                  ),
                ));
              },
              itemCount: 10,
              scrollDirection: Axis.horizontal,
            )),
          ],
        ),
      ),
    );
  }
}
