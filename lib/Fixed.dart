import 'package:flutter/material.dart';
import 'package:scopeindia/Drawer_items/Contactus.dart';
import 'package:scopeindia/Drawer_items/Scopeindia.dart';
import 'Drawer_items/Courses.dart';
import 'Drawer_items/Profile/Profile.dart';
import 'Drawer_items/Know.dart';
import 'Drawer_items/Placementcell.dart';
import 'Drawer_items/Profile/Update.dart';
import 'Login/Registeration.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Fixed extends StatefulWidget {
  final Widget body;
  Fixed({required this.body});

  @override
  State<Fixed> createState() => _FixedState();
}

class _FixedState extends State<Fixed> {
  final FirebaseAuth _auth=FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  String? _userName;
  String? _course;

  @override
  void initState() {
    super.initState();
    _fetchUserName();
  }
  Future<void> _fetchUserName() async {
    try {
      User? currentUser = _auth.currentUser; // Get the current logged-in user
      if (currentUser != null) {
        String uid = currentUser.uid; // Get user's uid

        // Fetch the document from Firestore using the user's uid
        DocumentSnapshot userDoc = await _firestore.collection('user_master').doc(uid).get();

        // Assuming the 'name' field is present in the user's document
        if (userDoc.exists && userDoc.data() != null) {
          setState(() {
            _userName = userDoc['name'];// Fetch the 'name' field
            _course=userDoc['course'];
          });
        } else {
          print('User document does not exist');
        }
      } else {
        print('No user is logged in');
      }
    } catch (e) {
      print('Error fetching user name: $e');
    }
  }
  @override
  Widget build(BuildContext context) {


    var h=MediaQuery.of(context).size.height;
    var w= MediaQuery.of(context).size.width;
    return
      MaterialApp(
        debugShowCheckedModeBanner: false ,
        home: Scaffold(
              // drawer: DrawerWidget(),
          drawer: Drawer(
            child: Container(
                color:Color.fromARGB(255, 7, 30, 103),
                child: ListView(
                  children: [
                    DrawerHeader(
                      padding: EdgeInsets.zero,
                      child: Container(
                        padding: EdgeInsets.all(10),
                        child: Center(
                          child: Row(children: [
                            CircleAvatar(
                                radius: 40,
                                backgroundImage: NetworkImage(
                                    'https://www.dmarge.com/wp-content/uploads/2021/01/dwayne-the-rock-.jpg')),


                            Container(
                              height: h/4,
                              width: w/2.2,
                              // color: Colors.red,
                              child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,

                                  children: [
                                    Text("Hi! ${_userName}",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18
                                      // backgroundColor: Colors.white
                                    ),),
                                    // Text(" Course:${_course}",
                                    //   style: TextStyle(
                                    //       color: Colors.white,
                                    //       fontWeight: FontWeight.bold,
                                    //       fontSize: 15
                                    //     // backgroundColor: Colors.white
                                    //   ),),


                                  ]
                              ),
                            )
                          ]),
                        ),
                      ),
                    ),


                    ListTile(
                      onTap:() {
                            Navigator.push(context, MaterialPageRoute(builder: (context) =>  Fixed(body: UserDetailPage())),);
                        // Navigator.push(context, MaterialPageRoute(builder: (context) => Fixed(body: UserDetailPage(userId: "0LbTevnZUZgjiizg34bRklECmYT2"))));
                      },
                      leading: Icon(Icons.account_circle_outlined,
                        color: Colors.white,),
                      title: Text('Profile',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold
                        ),
                      ),
                    ),



                    ListTile(
                      onTap:(){

                        Navigator.push(context, MaterialPageRoute(builder: (context) => Fixed(body: Scopeindia()),));
                      },
                      leading: Icon(Icons.home_outlined,
                        color: Colors.white,),
                      title: Text('Home',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold
                        ),
                      ),
                    ),


                    ListTile(
                      onTap:(){
                        Navigator.push(context, MaterialPageRoute(builder: (context) =>(Courses()) ));


                      },
                      leading: Icon(Icons.notes_outlined,
                        color: Colors.white,),
                      title: Text('Courses',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold
                        ),
                      ),
                    ),


                    ListTile(
                      onTap:(){

                        Navigator.push(context, MaterialPageRoute(builder: (context) => Fixed(body: MultipleUsersScreen()),));


                      },
                      leading: Icon(Icons.grade_outlined,
                        color: Colors.white,),
                      title: Text('Placement Cell',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold
                        ),
                      ),
                    ),


                    ListTile(
                      onTap:(){

                        Navigator.push(context, MaterialPageRoute(builder: (context) =>Fixed(body: Know())));



                      },
                      leading: Icon(Icons.info_outline,
                        color: Colors.white,),
                      title: Text('Know SCOPE INDIA',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold
                        ),
                      ),
                    ),


                    ListTile(
                      onTap:(){
                        Navigator.push(context, MaterialPageRoute(builder: (context) => Fixed(body: Contactus()),));


                      },
                      leading: Icon(Icons.contact_page_outlined   ,
                        color: Colors.white,),
                      title: Text('Contact Us',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold
                        ),
                      ),
                    ),




                    // MaterialButton(
                    //   padding:EdgeInsets.all(10),
                    //   color: Colors.orange.shade900,
                    //   child: Text("Log in",
                    //     style: TextStyle(
                    //         color: Colors.white,
                    //         fontWeight: FontWeight.bold,
                    //         fontSize: 18
                    //
                    //     ),
                    //   ),
                    //   onPressed: () {
                    //     Navigator.push(context, MaterialPageRoute(builder: (context) => Fixed(body: Loginpage()),));
                    //
                    //   },)
                  ],
                )
            ),
          ),
          appBar: AppBar(
            backgroundColor:Color.fromARGB(255, 7, 30, 103),
            iconTheme: IconThemeData(color: Colors.white70),
            centerTitle: true,
            title: Image(
              color:Colors.white,
                height: h/11,
                width: w/7,
                image:AssetImage("images/scope-india-logo-bird.png") ),
          ),

          body:widget.body,
            ),
      );
  }
}

