import 'package:flutter/material.dart';
import 'package:scopeindia/Drawer_items/Courses/Networking_cloud_Server/Aws.dart';
import 'package:scopeindia/Drawer_items/Courses/Networking_cloud_Server/Cisco.dart';
import 'package:scopeindia/Drawer_items/Courses/Networking_cloud_Server/Devops.dart';
import 'package:scopeindia/Drawer_items/Courses/Networking_cloud_Server/Networking.dart';
import 'package:scopeindia/Drawer_items/Courses/Networking_cloud_Server/Rhce.dart';
import 'package:scopeindia/Drawer_items/Courses/Networking_cloud_Server/Rhcsa.dart';
import 'package:scopeindia/Drawer_items/Courses/Others/Data_analytics.dart';
import 'package:scopeindia/Drawer_items/Courses/Others/Data_science.dart';
import 'package:scopeindia/Drawer_items/Courses/Others/Digital_marketing.dart';
import 'package:scopeindia/Drawer_items/Courses/Others/MS_Bi.dart';
import 'package:scopeindia/Drawer_items/Courses/Software_Prog_Courses/Dotnet.dart';
import 'package:scopeindia/Drawer_items/Courses/Software_Prog_Courses/Flutter.dart';
import 'package:scopeindia/Drawer_items/Courses/Software_Prog_Courses/Ionic.dart';
import 'package:scopeindia/Drawer_items/Courses/Software_Prog_Courses/Java.dart';
import 'package:scopeindia/Drawer_items/Courses/Software_Prog_Courses/Mean.dart';
import 'package:scopeindia/Drawer_items/Courses/Software_Prog_Courses/Mern.dart';
import 'package:scopeindia/Drawer_items/Courses/Software_Prog_Courses/Php.dart';
import 'package:scopeindia/Drawer_items/Courses/Software_Prog_Courses/Python.dart';
import 'package:scopeindia/Drawer_items/Courses/Software_Prog_Courses/Ui_ux.dart';
import 'package:scopeindia/Drawer_items/Courses/Software_Prog_Courses/Website_designing.dart';
import 'package:scopeindia/Drawer_items/Courses/Software_testing/Testing.dart';
import 'package:scopeindia/Drawer_items/Courses/course_widget.dart';
import 'package:scopeindia/Fixed.dart';


class Courses extends StatefulWidget {
  const Courses({super.key});

  @override
  State<Courses> createState() => _CoursesState();
}

class _CoursesState extends State<Courses> {
  late String text;
  final List<String> course_name=["Java Full Stack Internship","Python Full Stack Internship","PHP Full Stack Internship",".Net Core Full Stack Internship","MERN Full Stack Internship",
  "MEAN Full Stack Internship","Android/iOS Mobile App Course in Google Flutter",
    "Android/iOS Mobile App Course in IONIC","Website Designing Course","UI/UX Designing"] ;

  final List<String> course_name1=["Networking,Server & Cloud Administration",
  "AWS Architect Associate","Red Hat Certified System Administrator(RHCSA)","Red Hat Certified System Engineer(RHCE)",
  "DevOps Engineer","Cisco Certified Network Associate(CCNA)"];
  final List<String> course_name2=[ "Data Science & AI", "Data Analytics","Digital Marketing Expert","Microsoft Power BI"];

  final List<Widget> courses=[Java(),Python(),Php(), Dotnet(),Mern(),Mean(),Flutter(),Ionic(),Website_designing(),Ui_ux()];
  final List<Widget> courses1=[Networking(),Aws(),Rhcsa(),Rhce(), Devops(),Cisco()];
  final List<Widget> courses2=[ Datascience(),Data_analytics(),Digital_marketing(),Ms_Bi()];
  @override
  Widget build(BuildContext context) {
    var h= MediaQuery.of(context).size.height;
    var w= MediaQuery.of(context).size.width;
    return Fixed(
      body: Container(
          height: h,
          width: w,
          decoration: BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage("images/snowpark-mount.jpg")
            ),
          ),
          child: Scaffold(
            backgroundColor:Colors.transparent,

      
      
            body: SingleChildScrollView(
              child: Column(
                  children: [
                    Container(
                    height: h/2,
                  // color: Colors.red,
                  child: Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text("SCOPE INDIA",
                      textAlign: TextAlign.center,
                        style: TextStyle(
                          fontStyle: FontStyle.italic,
                          fontSize: 35,
                          color: Colors.yellow.shade800  ,
                          fontWeight: FontWeight.bold
                        ),
                      ),
                      Text("Center for Software, Networking, & Cloud Education",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 17,
                              fontWeight: FontWeight.bold
                          )
                      ),
                     Text("All Trainers at SCOPE INDIA are working professionals, Software Engineers, Networking Engineers"
                    " and Software Test Engineers of Suffix E Solutions with",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                            fontWeight: FontWeight.bold
                        ),
                    ),
                    Text(" 17 years of Industrial experience.",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontStyle:FontStyle.normal,
                          color: Colors.yellow.shade700,
                          fontSize: 20,
                          fontWeight: FontWeight.bold
                      )
                    ),
                    Image(height: h/18,
                        image: AssetImage("images/5star.png",
                        )
                    ),
                    Text('Google 4.9 * Rated Institute',
                      style: TextStyle(
                          color: Colors.white70
                      ) ,),
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(30),
                  // color: Colors.amber,
                child: Column(
                  mainAxisAlignment:MainAxisAlignment.spaceEvenly ,
                  children: [
                    Text("Software Programming Courses",
                      textAlign: TextAlign.start,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold
                      ),
                    ),

                    Container(
                      height: 550,
                      width: w,
                      child: ListView.builder(
                        itemCount: courses.length,
                          itemBuilder: (context,index){
      
                          return
                            MaterialButton(
                              height: 40,
                              minWidth:w,
                              color: Colors.purple.shade300,
                              child: Text(course_name[index],
                                textAlign: TextAlign.center,
                                style:TextStyle(
                                color: Colors.white70
                                    ),
                                  ),
                              onPressed: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context) => Fixed(body: courses[index])));
                              // Navigator.pop(context,Courses());
                              },
                          );
                        },
                      ),
                    ),
                      Text("Software Testing Courses",
                                  textAlign: TextAlign.start,
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold
                                  ),
                                ),
                    MaterialButton(
                         height: 40,
                         minWidth:w,
                        color: Colors.purple.shade300,
                         child: Text("Softwate Testing Advanced Course ",
                           textAlign: TextAlign.center,
                           style:TextStyle(
                               color: Colors.white70
                           ),
                         ),
                        onPressed: (){
                           Navigator.push(context, MaterialPageRoute(builder: (context) => Fixed(body: Testing()) ));
                         }
      
                         // course_widget(course_name: course_name1, courses: courses1)
      
                    )
                  ],
                ),
                ),
                    Container(
                      padding: EdgeInsets.all(30),
                      child: Column(
                        children: [
                        Text("Networking,Server & Cloud",
                                      textAlign: TextAlign.start,
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold
                                      ),
                                    ),

                          Container(
                            height: 300,
                            width: w,
                            child: ListView.builder(
                                itemCount: courses1.length,
                                itemBuilder: (context,index){
      
                                  return
                                    MaterialButton(
                                      height: 40,
                                      minWidth:w,
                                      color: Colors.purple.shade300,
                                      child: Text(course_name1[index],
                                        textAlign: TextAlign.center,
                                        style:TextStyle(
                                            color: Colors.white70
                                        ),
                                      ),
                                      onPressed: (){
                                        Navigator.push(context, MaterialPageRoute(builder: (context) => Fixed(body: courses1[index])));
                                      },
                                    );
                                }
                            ),
                          ),
                        ],
                      ),
                    ),

                    Container(
                      padding: EdgeInsets.all(30),
                      child: Column(
                        children: [
                          Text("Other Courses",
                            textAlign: TextAlign.start,
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold
                            ),
                          ),

                          Container(
                            height: 225,
                            width: w,
                            child: ListView.builder(
                                itemCount: courses2.length,
                                itemBuilder: (context,index){

                                  return
                                    MaterialButton(
                                      height: 40,
                                      minWidth:w,
                                      color: Colors.purple.shade300,
                                      child: Text(course_name2[index],
                                        textAlign: TextAlign.center,
                                        style:TextStyle(
                                            color: Colors.white70
                                        ),
                                      ),
                                      onPressed: (){
                                        Navigator.push(context, MaterialPageRoute(builder: (context) => Fixed(body: courses2[index])));
                                      },
                                    );
                                }
                            ),
                          ),
                        ],
                      ),
                    ),

                    Container(
                alignment: Alignment.center,
                height: h,
                width: w,
                child: Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [

                    Text("1500+",
                      style: TextStyle(
                          fontSize: 50,
                          color: Colors.blue,
                          fontWeight: FontWeight.bold
                      ),
                    ),

                    Text("STUDENTS ARE ",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.bold
                      ),
                    ),

                    Text("TRAINED EVERY YEAR",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.bold
                      ),
                    ),

                    Text("30+",
                      style: TextStyle(
                          fontSize: 50,
                          color: Colors.blue,
                          fontWeight: FontWeight.bold
                      ),
                    ),

                    Text("COMPUTER COURSES ",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.bold
                      ),
                    ),

                    Text("95%",
                      style: TextStyle(
                          fontSize: 50,
                          color: Colors.blue,
                          fontWeight: FontWeight.bold
                      ),
                    ),

                    Text("STUDENTS ARE  GETTING ",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.bold
                      ),
                    ),

                    Text("PLACED EVERY YEAR ",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.bold
                      ),
                    ),

                    SizedBox(
                      height:h/20,
                    ),

                    Image(
                      image: AssetImage("images/snowpark-footer-logo.png",
                      ),
                      height: h/8,
                      width: w/1.3,
                    ),

                    Text("Center for Software, Networking, & Cloud Education",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.white70,
                          fontSize: 12
                      ),
                    ),

                    Text("Kerala: Technopark TVM | Thampanoor TVM | Kaloor Kochi, Tamil Nadu: Distillery Road | Palace Road Nagercoil",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.white70,
                          fontSize: 12
                      ),
                    ),

                    Image(
                      image: AssetImage(
                          "images/iso_iaflogo.png"),
                      height: h/8,
                      width: w/1.3,
                    ),

                    Text("An ISO 9001:2015 Certified Company",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 15,
                          color: Colors.white70
                      ),
                    ),

                    Text(" All Rights Reserved Suffix E Solutions © 2007-2024",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 15,
                          color: Colors.white70
                      ),
                    ),

                    Text("9745936073 (TPK)",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 10
                      ),
                    ),

                    Text("9745936073 (TVM)",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 10
                      ),
                    ),

                    Text("7592939481 (EKM)",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 10
                      ),
                    ),

                    Text("8075536185 (NGL)",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 10
                      ),
                    ),

                    Text("info@scopeindia.org",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 10
                      ),
                    )
                        ],
                      ),
                    )
                  ],
                ),
            ),
            ),
        ),
    );
  }
}
