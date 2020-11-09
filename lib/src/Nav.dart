//---- Packages
import 'package:flutter/material.dart';

//---- Screens
import 'package:linger/src/pages/home/Home.dart';
import 'package:linger/src/pages/market/Market.dart';
import 'package:linger/src/pages/user/User.dart';

class Nav extends StatefulWidget {
  @override
  _NavState createState() => _NavState();
}

class _NavState extends State<Nav> {
  int _page = 0;

  _setScreen(int page) {
    switch (page) {
      case 0:
        return Home();
        break;
      case 1:
        return Market();
        break;
      case 2:
        return User();
        break;
      default:
        Home();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _setScreen(_page),
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: _page,
          onTap: (value) {
            setState(() {
              _page = value;
            });
          },
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
            BottomNavigationBarItem(
                icon: Icon(Icons.add_shopping_cart_sharp), label: "Cart Shop"),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: "User")
          ]),
    );
  }
}
