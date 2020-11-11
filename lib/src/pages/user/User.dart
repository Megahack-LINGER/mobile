import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class User extends StatefulWidget {
  @override
  _UserState createState() => _UserState();
}

class _UserState extends State<User> {
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
                  height: size.height * 0.23,
                  decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(40),
                          bottomRight: Radius.circular(40))),
                  child: Column(
                    children: [
                      Divider(
                        color: Colors.blue,
                        height: size.height * 0.05,
                      ),
                      ClipRRect(
                          borderRadius: BorderRadius.circular(200),
                          child: Image.network(
                            FirebaseAuth.instance.currentUser.photoURL != null
                                ? FirebaseAuth.instance.currentUser.photoURL
                                : "",
                            filterQuality: FilterQuality.high,
                            fit: BoxFit.fill,
                            height: size.height * 0.17,
                            width: size.width * 0.35,
                          )),
                    ],
                  )),
              Divider(color: Colors.white),
              Padding(
                padding: EdgeInsets.all(16),
                child: Column(
                  children: [
                    TextFormField(
                      keyboardType: TextInputType.name,
                      initialValue:
                          FirebaseAuth.instance.currentUser.displayName,
                      decoration: InputDecoration(
                          floatingLabelBehavior: FloatingLabelBehavior.auto,
                          labelText: "Atualize seu nome",
                          border: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.blue))),
                    ),
                    Divider(color: Colors.white),
                    TextFormField(
                      keyboardType: TextInputType.emailAddress,
                      initialValue: FirebaseAuth.instance.currentUser.email,
                      decoration: InputDecoration(
                          floatingLabelBehavior: FloatingLabelBehavior.auto,
                          labelText: "Atualize seu Email",
                          border: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.blue))),
                    ),
                    Divider(color: Colors.white),
                    Text("Atualize sua foto de perfil: "),
                    IconButton(
                      icon: Icon(Icons.camera, color: Colors.blue),
                      onPressed: () async {
                        var file;
                        try {
                          file = await ImagePicker.platform
                              .pickImage(source: ImageSource.camera);
                          print(file.path);
                        } catch (e) {
                          print(e);
                        }
                      },
                      tooltip: "Adicionar foto",
                    ),
                  ],
                ),
              ),
            ],
          )),
    );
  }
}
