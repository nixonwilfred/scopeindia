import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:scopeindia/Fixed.dart';
import 'package:scopeindia/Drawer_items/Scopeindia.dart';

import 'Registeration.dart';

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
      debugShowCheckedModeBanner: false,
      home:SingleChildScrollView(
        child: Container(
          height: h,
          width: w,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("images/v960-ning-11.jpg"),
              fit: BoxFit.cover
            )
          ),
          child: Scaffold(backgroundColor: Colors.transparent,
          body: SingleChildScrollView(
            child: Container(
              child: Column(mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: h/4,),
                            CircleAvatar(
                              backgroundColor:Colors.blue.shade700,
                              radius: w/13,
                              // radius: 30,
                              child: Image(
                                height: 40,
                                  image:AssetImage("images/scope-india-logo-bird.png"),
                                fit: BoxFit.fill,
                              ),
                    
                            ),
                            SizedBox(
                              height:w/9,
                            ),
                    
                            Padding(
                              padding: EdgeInsets.all(13),
                              child: Column(
                                  children: [
                                    Padding(padding: EdgeInsets.all(15),
                                      child: Container(
                                        height: w/8,
                                        child: TextField(
                                          onChanged: (input)  {
                                            setState(() {
                                              email=input;
                                            });
                                          },
                                          decoration: InputDecoration(
                                              border: OutlineInputBorder(
                                                borderRadius: BorderRadius.horizontal(
                                                  right:Radius.circular(20),left: Radius.circular(20)
                                                )
                                              ),
                                              labelText: "Email address",
                                              hintText:"Enter the Email"
                                          ),
                                        ),
                                      ),
                                    ),
                                    Padding(padding: EdgeInsets.all(15),
                                      child: Container(
                                        height: w/8,
                                        child: TextField(
                                          onChanged: (input)  {
                                            setState(() {
                                              password=input;
                                            });
                                          },
                                          obscureText: true,
                                          decoration: InputDecoration(
                                            
                                              border: OutlineInputBorder(
                                                  borderRadius: BorderRadius.horizontal(
                                                      right:Radius.circular(20),left: Radius.circular(20)
                                              ),
                                              ),
                                              labelText: "Password",
                                              hintText:"Enter the password"
                                          ),
                                        ),
                                      ),
                                    ),
                    
                    
                                    Container(
                                      child: ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                          minimumSize: Size(h/2.37, w/9),
                                          backgroundColor: Colors.blue.shade700,
                                            shape: const RoundedRectangleBorder(
                                                borderRadius: BorderRadius.all(Radius.circular(50))
                                            )
                                        ),
                                        onPressed: () async {
                                          try {
                                            UserCredential userCredential = await _auth.signInWithEmailAndPassword(
                                              email: email,
                                              password: password,
                                            );
                                            Navigator.push(context, MaterialPageRoute(builder: (context) => Fixed(body: Scopeindia()),));
                    
                                            print("Login Successful:${userCredential.user?.email}");
                                          }
                                          catch(e){
                                            print("login failed: $e");
                                          }
                                        },
                                        child: Text("Log in",
                                          style: TextStyle(
                                            color: Colors.white,
                                          fontSize: 17
                                        ),
                                     ),
                                      ),
                                    ),
                                        Row(mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            TextButton(
                                                onPressed: (){
                                                  Navigator.push(context, MaterialPageRoute(builder: (context) => Loginpage()));

                                                }, child: Text("Forgotten Password?",
                                                style: TextStyle(
                                                    color: Colors.black87
                                                ))
                                            ),
                                            TextButton(onPressed: (){
                                                Navigator.push(context, MaterialPageRoute(builder:(context) => Scopeindia(),));
}                                               , child: Text("Skip",
                                            style: TextStyle(
                                              color: Colors.black87
                                            ),))
                                          ],
                                        ),

            
            
                                        SizedBox(
                                          height: w/3,
                                        ),
                    
                                        OutlinedButton(
            
                                          style: ElevatedButton.styleFrom(
                                            minimumSize: Size(h/2.37, w/9)
            
                                          ),
                                            onPressed:(){
                                              Navigator.push(context,MaterialPageRoute(builder:(context) =>  Registeration(),));
                                            },
                    
                                            child: Text("Create new account",
                                            style: TextStyle(
                                              color: Colors.black87
                                            ),)
                    
                                        ),
            
                    
                                  ]
                              )
                  ),
                ],
              ),
            ),
          ),
          ),
        ),
      ),
    );
  }
}


