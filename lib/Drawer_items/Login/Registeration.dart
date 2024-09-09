import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:scopeindia/Drawer_code/Drawer_.dart';
import 'package:scopeindia/Drawer_items/Login/Loginpage.dart';


late String name;
late String date_of_birth;
late String password;
late String emailid;
late String mobileno;
final _auth=FirebaseAuth.instance;
final _firestore=FirebaseFirestore.instance;


class Registeration extends StatefulWidget {
  const Registeration({super.key});

  @override
  State<Registeration> createState() => _RegisterationState();
}

class _RegisterationState extends State<Registeration> {
  var items=["Male","Female","Other"];
  var items1=["PHP Full Stack","PYTHON Full Stack","JAVA Full Stack","C#.NET Core 7 Full Stack","MEAN Full Stack","MERN Full Stack","Data Science & AI (Python Guru)","Python Mastery (Python/Django/MySQL)","Google Flutter Mobile App Development (iOS/Android)","UI/UX Designing","SEO/SEM/SMM/ Courses","Digital Marketing Master Program","Software Testing Courses","Computer Networking & Server Courses"];
  String course="";
  String gender="";

  @override
  Widget build(BuildContext context) {
    var h=MediaQuery.of(context).size.height;
    var w= MediaQuery.of(context).size.width;
    return PopScope(
      canPop: false,
      child: Scaffold(

        drawer: Drawer_(),
        appBar:  AppBar(
        backgroundColor: Colors.blue.shade900,
        centerTitle: true,
        title: Image(
            height: h/11,
            width: w/7,
            image:AssetImage("images/scope-india-logo-bird.png") ),
      ),
              body:Padding(
                padding: EdgeInsets.all(15),
                child: SingleChildScrollView(
                  child: Container(
                    height: h,
                    width: w,
                    child: Column(
                      children: [
      
      
                        Padding(padding: EdgeInsets.all(15),
                          child:TextField(
                            onChanged: (i){
                              name=i;
                            },
                            decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: 'Full Name(required)',
                                hintText: 'Enter your name'
                            ),
                          ),
                        ),
      
      
                        Padding(padding: EdgeInsets.all(15),
                          child:TextField(
                            onChanged: (i){
                              date_of_birth=i;
                            },
                            decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: 'Date Of Birth(required)',
                                hintText: 'Enter your Date Of Birth'
                            ),
                          ),
                        ),
      
                        Padding(
                          padding: EdgeInsets.all(15),
                          child: TextField(
                            onChanged: (i){
                              emailid = i;
                            },
                            decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: 'Email',
                                hintText: 'Enter Your Email'
                            ),
                          ),
                        ),
      
      
                        Padding(
                          padding: EdgeInsets.all(15),
                          child: TextField(
                            onChanged: (i){
                              mobileno = i;
                            },
                            decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: 'Mobile No',
                                hintText: 'Enter Your Mobile No'
                            ),
                          ),
                        ),
      
      
                        Padding(
                          padding: EdgeInsets.all(15),
                          child: TextField(
                            obscureText: true,
                            onChanged: (i){
                              password = i;
                            },
                            decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: 'Password',
                                hintText: 'Enter Your Password'
                            ),
                          ),
                        ),
      
      
                        Padding(
                          padding: EdgeInsets.all(15),
                            child:
                            DropdownButtonFormField(
                              hint: Text("select your gender"),
                              dropdownColor: Colors.white,
                              decoration: InputDecoration(
                                labelText:"Gender (required)",
                                border: OutlineInputBorder(),
                              ),
                              icon: Icon(Icons.keyboard_arrow_down),
                              items: items.map((String items){
                                 return DropdownMenuItem(
                                  value: items,
                                  child: Text(items,
                                    style: TextStyle(
                                        fontSize: 13
                                    ) ,
                                  ),
                                );
                              }).toList(),
                              onChanged: (String ? value){
                                setState(() {
                                  gender=value!;
      
                                });
                              },
                            ),
                        ),
      
      
                        Padding(
                          padding: EdgeInsets.all(15),
                          child: DropdownButtonFormField(
                            hint: Text("Choose your course"),
                            dropdownColor: Colors.white,
                            decoration: InputDecoration(
                              labelText:"Choose your course(required)",
                              border: OutlineInputBorder(),
                            ),
                            icon: Icon(Icons.keyboard_arrow_down),
                            items: items1.map((String items1){
                              return DropdownMenuItem(
                                value: items1,
                                child: Text(items1,
                                  style: TextStyle(
                                      fontSize: 10
                                  ),
                                ),
                              );
                            }).toList(),
                            onChanged: (String ? value){
                              setState(() {
                                course=value!;
                              });
                            },
                          ),
                        ),
      
      
      
      
      
                        ElevatedButton(
                          onPressed: () async {
                            try {
                              // Create a new user in Firebase Authentication
                              final newUser = await _auth.createUserWithEmailAndPassword(email: emailid, password: password);
      
                              // Check if user creation is successful
                              if (newUser!= null) {
                                print("User created successfully: $newUser");
                                // Navigator.push(context,MaterialPageRoute(builder:(context) =>  Loginpage(),));
      
                                // Add user information to Firestore
                                await _firestore.collection('user_master').add({
                                  'email_id': emailid,
                                  'name': name,
                                  'mobileNo': mobileno,
                                   'gender':gender,
                                  'course':course,
                                  'date of birth':date_of_birth,
                                  'password':password
      
      
                                });
      
                                print("User data added to Firestore successfully");
      
                                // Navigate to the login page
                                Navigator.push(context, MaterialPageRoute(builder: (context)=>Loginpage()));
                              }
                            } catch (e) {
                              // Handle any errors that occur during user creation or Firestore update
                              print("Error: $e");
                            }
                          },
                          child: Text("Register"),
                        ),
      
                      ],
                    ),
                  ),
                ),
              ),
      ),
    );
  }
}
