import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:scopeindia/Drawer_items/Login/Registeration.dart';
import 'package:scopeindia/Scopeindia.dart';

class Loginpage extends StatefulWidget {

  Loginpage({super.key});

  @override
  State<Loginpage> createState() => _LoginpageState();
}

class _LoginpageState extends State<Loginpage> {
  String email ="";
  String password="";

  @override
  Widget build(BuildContext context) {
    var h=MediaQuery.of(context).size.height;
    var w= MediaQuery.of(context).size.width;
    final FirebaseAuth _auth=FirebaseAuth.instance;
    return MaterialApp(
      home: Scaffold(
          appBar:  AppBar(
            backgroundColor: Colors.blue.shade900,
            centerTitle: true,
            title: Image(
                height: h/11,
                width: w/7,
                image:AssetImage("images/scope-india-logo-bird.png") ),
          ),
          body: Padding(
              padding: EdgeInsets.all(15),
              child: Column(
                  children: [
                    Padding(padding: EdgeInsets.all(15),
                      child: TextField(
                        onChanged: (input)  {
                          setState(() {
                            email=input;
                          });
                        },
                        decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: "Username",
                            hintText:"Enter the Email"
                        ),
                      ),
                    ),
                    Padding(padding: EdgeInsets.all(15),
                      child: TextField(
                        onChanged: (input)  {
                          setState(() {
                            password=input;
                          });
                        },
                        obscureText: true,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: "Password",
                            hintText:"Enter the password"
                        ),
                      ),
                    ),

                    ElevatedButton(
                      onPressed: () async {
                        try {
                          UserCredential userCredential = await _auth.signInWithEmailAndPassword(
                            email: email,
                            password: password,
                          );
                          Navigator.push(context, MaterialPageRoute(builder: (context) => Scopeindia(),));

                          print("Login Successful:${userCredential.user?.email}");
                        }
                        catch(e){
                          print("login failed: $e");
                        }
                      },
                      child: Text("Sign in"),
                    ),
                    Row(mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Don't Have an Account?"),
                        TextButton(
                            onPressed:(){
                              Navigator.push(context,MaterialPageRoute(builder:(context) =>  Registeration(),));
                            },

                            child: Text("Register now")

                        ),
                      ],
                    )
                  ]
              )
          )
      ),
    );
  }
}




