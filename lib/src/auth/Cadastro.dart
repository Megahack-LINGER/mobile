//---- Packages
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

//---- Screens
import 'package:linger/src/Nav.dart';

class Cadastro extends StatefulWidget {
  @override
  _CadastroState createState() => _CadastroState();
}

class _CadastroState extends State<Cadastro> {
  TextEditingController _controllerEmail = TextEditingController();
  TextEditingController _controllerPassword = TextEditingController();

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
            Divider(
              height: size.height * 0.2,
              color: Colors.blue,
            ),
            Container(
              padding: EdgeInsets.all(16),
              child: Column(
                children: [
                  Container(
                    height: size.height * 0.065,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(40)),
                    child: TextField(
                      controller: _controllerEmail,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                          prefixIcon: Icon(Icons.email, color: Colors.blue),
                          border: InputBorder.none,
                          hintText: "Digite seu email",
                          contentPadding: EdgeInsets.all(18)),
                    ),
                  ),
                  Divider(height: 20, color: Colors.blue),
                  Container(
                    height: size.height * 0.065,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(40)),
                    child: TextField(
                      controller: _controllerPassword,
                      keyboardType: TextInputType.visiblePassword,
                      obscureText: true,
                      decoration: InputDecoration(
                          prefixIcon: Icon(Icons.vpn_key, color: Colors.blue),
                          border: InputBorder.none,
                          hintText: "Digite sua senha",
                          contentPadding: EdgeInsets.all(18)),
                    ),
                  ),
                ],
              ),
            ),
            ClipRRect(
                borderRadius: BorderRadius.circular(40),
                child: Container(
                    width: size.width * 0.4,
                    height: size.height * 0.05,
                    child: RaisedButton(
                        splashColor: Colors.blue[100],
                        onPressed: () async {
                          print(_controllerPassword.text);
                          try {
                            await FirebaseAuth.instance
                                .createUserWithEmailAndPassword(
                                    email: _controllerEmail.text,
                                    password: _controllerPassword.text);
                            await Navigator.pushAndRemoveUntil(
                                context,
                                MaterialPageRoute(builder: (context) => Nav()),
                                (route) => false);
                          } catch (e) {
                            if (e.code == "firebase_auth/user-not-found") {
                              print("Usuário não encontrado");
                            }
                            print(e);
                          }
                        },
                        child: Text("Cadastrar")))),
          ],
        ),
      ),
    );
  }
}
