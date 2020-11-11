//---- Packages
import 'dart:convert';
import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

//---- Screens
import 'package:linger/src/Nav.dart';
import 'package:linger/src/auth/Login.dart';
import 'package:path_provider/path_provider.dart';

class Cadastro extends StatefulWidget {
  @override
  _CadastroState createState() => _CadastroState();
}

class _CadastroState extends State<Cadastro> {
  TextEditingController _controllerEmail = TextEditingController();
  TextEditingController _controllerPassword = TextEditingController();

  FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  Future<File> getData() async {
    final directory = await getApplicationDocumentsDirectory();
    return File("${directory.path}/data.json");
  }

  Future saveData() async {
    final file = await getData();
    await file.writeAsStringSync(jsonEncode({
      "email": _controllerEmail.text,
      "name": _firebaseAuth.currentUser.displayName,
      "image": _firebaseAuth.currentUser.photoURL
    }));
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.network(
                "https://cdn.discordapp.com/attachments/769682105948438601/775794281654779914/SPOILER_LINGER_VETOR.png",
              ),
              Divider(color: Colors.white),
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
                        keyboardType: TextInputType.emailAddress,
                        controller: _controllerEmail,
                        decoration: InputDecoration(
                            prefixIcon: Icon(Icons.email, color: Colors.blue),
                            border: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.blue)),
                            hintText: "Digite seu email",
                            contentPadding: EdgeInsets.all(18)),
                      ),
                    ),
                    Divider(height: 20, color: Colors.white),
                    Container(
                      height: size.height * 0.065,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(40)),
                      child: TextField(
                        keyboardType: TextInputType.visiblePassword,
                        obscureText: true,
                        controller: _controllerPassword,
                        decoration: InputDecoration(
                            prefixIcon: Icon(Icons.vpn_key, color: Colors.blue),
                            border: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.blue)),
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
                          color: Colors.blue,
                          splashColor: Colors.blue[100],
                          onPressed: () async {
                            print(_controllerPassword.text);
                            try {
                              await FirebaseAuth.instance
                                  .createUserWithEmailAndPassword(
                                      email: _controllerEmail.text,
                                      password: _controllerPassword.text);

                              await saveData();

                              await Navigator.pushAndRemoveUntil(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Nav()),
                                  (route) => false);
                            } catch (e) {
                              print(e);
                            }
                          },
                          child: Text("Cadastra-se",
                              style: TextStyle(color: Colors.white))))),
              Divider(color: Colors.white),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Já tem uma conta?",
                  ),
                  TextButton(
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => Login()));
                      },
                      child: Text(
                        "Login",
                        style: TextStyle(color: Colors.blue),
                      ))
                ],
              ),
            ],
          ),
        ));
  }
}
