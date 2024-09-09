import 'package:flutter/material.dart';
import 'package:scopeindia/Drawer_items/Courses/Software_Prog_Courses/Dotnet.dart';
import 'package:scopeindia/Drawer_items/Courses/Software_Prog_Courses/Flutter.dart';
import 'package:scopeindia/Drawer_items/Courses/Software_Prog_Courses/Ionic.dart';
import 'package:scopeindia/Drawer_items/Courses/Software_Prog_Courses/Mean.dart';
import 'package:scopeindia/Drawer_items/Courses/Software_Prog_Courses/Mern.dart';
import 'package:scopeindia/Drawer_items/Courses/Software_Prog_Courses/Ui_ux.dart';
import 'package:scopeindia/Drawer_items/Courses/Software_Prog_Courses/Website_designing.dart';
import 'package:scopeindia/Drawer_items/Courses/Software_testing/Testing.dart';


class course_widget extends StatefulWidget {
  late List<String> course_name=["Net Core Full Stack Internship","MERN Full Stack Internship",
    "MEAN Full Stack Internship","Android/iOS Mobile App Course in Google Flutter",
    "Android/iOS Mobile App Course in IONIC","Website Designing Course","UI/UX Designing",
    // "":Testing(),"Networking,Server & Cloud Administration":Networking(),
    // "AWS Architect Associate":Aws(),"Red Hat Certified System Administrator(RHCSA)": Rhcsa(),"Red Hat Certified System Engineer(RHCE)":Rhce(),
    // "DevOps Engineer": Devops(),"Cisco Certified Network Associate(CCNA)":Cisco(), "Data Science & AI": Datascience(),
    // "Data Analytics":Data_analytics(),"Digital Marketing Expert":Digital_marketing(),"Microsoft Power BI":Ms_Bi()
  ];
  late List<Widget> courses=[Dotnet(),Mern(),Mean(),Flutter(),Ionic(),Website_designing(),Ui_ux()];


  course_widget({
    required this.course_name,
    required this.courses
     });

  @override
  State<course_widget> createState() => _course_widgetState();
}

class _course_widgetState extends State<course_widget> {

  @override
  Widget build(BuildContext context) {
    var h=MediaQuery.of(context).size.height;
    var w= MediaQuery.of(context).size.width;
    return  Container(
        height: h/2,
    width: w,
    // color: Colors.red,
    child: ListView.builder(
    itemCount: widget.courses.length,
    itemBuilder: (context,index)
    {
      MaterialButton(
        height: 40,
        minWidth: 300,
        color: Colors.purple.shade300,
        child: Text(widget.course_name[index],
          textAlign: TextAlign.center,
          style: TextStyle(
              color: Colors.white70
          ),
        ),
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => widget.courses[index]));
        },
      );
    }
    )
    );
  }
}



