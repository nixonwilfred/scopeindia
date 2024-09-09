 import 'package:flutter/material.dart';
import 'package:scopeindia/Drawer_items/Courses/Courses.dart';

import 'package:scopeindia/Drawer_items/Login/Loginpage.dart';
import 'package:scopeindia/Scopeindia.dart';

class Drawer_ extends StatelessWidget {
  const Drawer_({super.key});

  @override
  Widget build(BuildContext context) {
    var h=MediaQuery.of(context).size.height;
    var w= MediaQuery.of(context).size.width;
    return Drawer(
      child: Container(
          color: Colors.blue.shade900,

          child: ListView(
            children: [
              // drawer_listtile("Home", Icons.home_outlined),
              // drawer_listtile("Courses",Icons.notes_outlined),
              // drawer_listtile("Placement Cell",Icons.grade_outlined),
              // drawer_listtile("Know Scope India", Icons.info_outline),
              // drawer_listtile('Contact Us',Icons.contact_page_outlined),



              ListTile(
                onTap:(){
                  Navigator.push(context,MaterialPageRoute(builder: (context) => Scopeindia(),));
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
                  Navigator.push(context,MaterialPageRoute(builder: (context) => Courses(),));

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


              MaterialButton(
                // padding:EdgeInsets.all(10),
                color: Colors.orange.shade900,
                child: Text("Log in",
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 18

                  ),
                ),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => Loginpage(),));

                },)
            ],
          )
      ),
    );
  }

  Widget drawer_listtile (String text,IconData icon,){
    return
      ListTile(
        leading: Icon(icon,
          color: Colors.white,),
        title: Text(text,
          style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold
          ),
        ),
      );
  }

}
