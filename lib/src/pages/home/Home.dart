//---- Packages
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Container(
        width: size.width,
        height: size.height,
        child: Column(
          children: [
            Container(
                width: size.width,
                height: size.height * 0.25,
                decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(40),
                        bottomRight: Radius.circular(40))),
                child: Column(
                  children: [
                    Divider(color: Colors.blue),
                    ClipRRect(
                        borderRadius: BorderRadius.circular(200),
                        child: Image.network(
                          FirebaseAuth.instance.currentUser.photoURL != null
                              ? FirebaseAuth.instance.currentUser.photoURL
                              : "",
                          filterQuality: FilterQuality.high,
                          fit: BoxFit.fill,
                          height: size.height * 0.14,
                          width: size.width * 0.3,
                        )),
                    Divider(color: Colors.blue),
                    Container(
                      width: size.width * 0.9,
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
            Container(
                width: size.width,
                height: size.height * 0.7,
                child: ListView.builder(
                  itemCount: 10,
                  scrollDirection: Axis.vertical,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                        child: Card(
                      shape: RoundedRectangleBorder(
                          side: BorderSide(color: Colors.white, width: 1),
                          borderRadius: BorderRadius.circular(20)),
                      elevation: 0.0,
                      child: Column(
                        children: [
                          ClipRRect(
                            //Ou circular(20)
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(20),
                                topRight: Radius.circular(20)),
                            child: Image.network(
                                "https://cdn.pixabay.com/photo/2020/07/17/19/22/landscape-5415202_960_720.jpg",
                                height: size.height * 0.3),
                          ),
                          Center(
                            child: ListTile(
                              title: Text("Aluga-se 1 hora de empressora 3D",
                                  style: TextStyle(color: Colors.blue[800])),
                              subtitle: Text("Bico com 3MM e várias cores",
                                  style: TextStyle(color: Colors.blue[400])),
                              trailing: Text(
                                "R\S24,99 por Hora",
                                style: TextStyle(color: Colors.blue),
                              ),
                            ),
                          ),
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
