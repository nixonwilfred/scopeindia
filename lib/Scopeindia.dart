import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:scopeindia/Drawer_code/Drawer_.dart';
import 'package:scopeindia/Drawer_items/Courses/Courses.dart';
import 'package:scopeindia/Drawer_items/Courses/Networking_cloud_Server/Aws.dart';
import 'package:scopeindia/Drawer_items/Courses/Networking_cloud_Server/Devops.dart';
import 'package:scopeindia/Drawer_items/Login/Registeration.dart';



class Scopeindia extends StatefulWidget {
  const Scopeindia({super.key});
  @override
  State<Scopeindia> createState() => _ScopeindiaState();
}
class _ScopeindiaState extends State<Scopeindia> {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home:Home()
    );
    }
}
class Home extends StatefulWidget {
  const Home({super.key});
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final List<String> items= ["carousel_images/Devops-training-scopeindia.jpg",
    "carousel_images/scope-india-aws-certification-course-(1).jpg",];
  // "carousel_images/scope-india-azure-certification-course.jpg",
  // "carousel_images/scope-india-digital-marketing-course.jpg",
  // "carousel_images/scope-india-dotnet-core-full-stack-course.jpg",
  // "carousel_images/scope-india-flutter-fullstack-course.jpg",
  // "carousel_images/scope-india-java-full-stack-course (1).jpg",
  // "carousel_images/scope-india-mean-mern-stack-course.jpg",
  // "carousel_images/scope-india-network-server-administration-course (1).jpg",
  // "carousel_images/scope-india-php-full-stack-course (1).jpg",
  // "carousel_images/scope-india-python-full-stack-course (1).jpg",
  // "carousel_images/scope-india-software-testing-manual-automation-course.jpg",];
  final List<Widget> courses=[Devops(),Aws()];
  @override
  Widget build(BuildContext context) {
    var h=MediaQuery.of(context).size.height;
    var w= MediaQuery.of(context).size.width;
    return Scaffold(
          drawer: Drawer_(),
          appBar: AppBar(
            backgroundColor: Colors.blue.shade900,
            centerTitle: true,
            title: Image(
                height: h/11,
                width: w/7,
                image:AssetImage("images/scope-india-logo-bird.png") ),
          ),
          body:SingleChildScrollView(
            child:
                Column(
                  children: [
                    Container(
                      height:h/3.5,
                      width: w,
                      // color: Colors.red,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          fit: BoxFit.fill,
                          image: AssetImage(
                              "images/slider_bg.jpg"),
                     alignment: Alignment.center   ),
                      ),

                      child:Column(
                          children: [
                            Container(
                              height: h/4,
                              width: w/2,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                    fit: BoxFit.contain,
                                    image: AssetImage("images/scope-india-logo-home-page.png",
                                    ),
                                    alignment: Alignment.center    ),
                              ),
                            ),
                          ]
                      ),
                    ),
                    Container(
                      color: Colors.blue.shade900,
                      child: CarouselSlider.builder(
                          itemCount: items.length,
                          options: CarouselOptions(
                          height:h/3,
                          enlargeCenterPage: true,
                          autoPlay: true,
                          aspectRatio: 16/9,
                        ),
                          itemBuilder: (context,index,anyIndex){
                            return  Container(
                              margin: EdgeInsets.symmetric(horizontal:5),
                            decoration: BoxDecoration(
                                // color: Colors.red,
                            ),
                             child:  GestureDetector(
                                  child: Image(
                                    image: AssetImage(
                                        "${items[index]}"),
                                    fit:BoxFit.contain,
                                  ),
                                  onTap: () {
                                    Navigator.push(context, MaterialPageRoute(builder: (context) => courses[index],
                                    ),
                                    );
                                  }
                              ),
                            );
                          },
                      ),
                    ),


                    Container(
                        height: h/18,
                        width: w,
                        color: Colors.blue.shade900,
                        child: Image(
                            height:h/18,
                            fit: BoxFit.cover,
                            image: AssetImage(
                              "images/snowpark-home-slide-decoration-bottomm.png",
                            )
                        )
                    ),

                    Container(
                        child: Column(
                      children: [
                        Text("SCOPE INDIA is open 365 days a year ",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                          color: Colors.blue.shade900,
                              fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                        Text("We are open 7 days 24 hrs to talk to you and listen to your queries.",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.blue.shade900,
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                          ),
                        ),
                        Text("GET A FREE CALL BACK",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.green.shade700,
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                          ),
                        ),
                      ],
                    )
                    ),
                    SizedBox(
                      height: h/35,
                    ),

                    Container(
                      child: Column(
                        children: [
                          Image(height: h/13,
                              image: AssetImage("images/5star.png",
                              )
                          ),
                    Text('Google 4.9 * Rated Institute',
                      style: TextStyle(
                          color: Colors.black87
                      ) ,),
                    Text("SCOPE INDIA, your career partner!",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 25,
                        color: Colors.blue.shade900,
                      ),
                    ),

                    Text("One of India's best Training destinations for Software, Networking, and Cloud Computing courses with 17 years of Industrial experience.",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Colors.blue.shade900,
                      ),
                    ),

                    Container(
                      // color: Colors.blue,
                      padding: EdgeInsets.all(30),
                      child: Column(
                        children: [
                          Text("Software, Networking, and Cloud Professional Education Centre in Kerala and Tamil Nadu from Suffix E Solutions with WORKING PROFESSIONALS oriented on-the-job TRAINING model. SCOPE INDIA provides courses for Software Programming in Python (Data Science | Artificial Intelligence | Machine Learning | Deep Learning, Data Analytics), Java, PHP, .Net, MERN,Software Testing Manual and Automation, Cloud Computing (AWS | Azure), Server Administration (MicroSoft MCSE | Linux RHCE), Networking (CCNA), DevOps, Mobile App Development in Flutter, and Digital Marketing. A Training with a 100% Trusted Job-Based Internship Model. SCOPE INDIA has a Strong Placement Cell that provides jobs to thousands of students annually. We assure you, you won't regret it after training from SCOPE INDIA!",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 13,
                              color: Colors.blue.shade900,
                            ),
                          ),
                          SizedBox(
                            height: h/30,
                          ),
                          Text("This is how SCOPE INDIA can support both newbies and those experienced in the industry to upgrade their skills.",
                            style: TextStyle(
                              fontSize: 13,
                              color: Colors.blue.shade900,
                            ),
                          ),
                          SizedBox(
                            height: h/25,
                          ),

                          MaterialButton(
                              height: 40,
                              minWidth: w,
                              color: Colors.purple.shade300,
                              onPressed: (){


                              },
                              child: Text("Recent placements",
                                style:TextStyle(
                                  color: Colors.white
                              ),)
                          ),
                          MaterialButton(
                              height: 40,
                              minWidth: w,
                              color: Colors.teal.shade300,
                              onPressed: (){
                                Navigator.push(context, MaterialPageRoute(builder: (context) => Courses(),));

                              },
                              child: Text("Courses",
                                style:TextStyle(
                                    color: Colors.white
                                ),)
                          ),

                          MaterialButton(
                              height: 40,
                              minWidth: w,
                              color: Colors.green,
                              onPressed: (){
                                Navigator.push(context, MaterialPageRoute(builder: (context) => Registeration(),));
                              },
                              child: Text("Register Now!",style:TextStyle(
                                  color: Colors.white70
                              ),)
                          ),
                          MaterialButton(
                              height: 40,
                              minWidth: w,
                              color: Colors.green,
                              onPressed: (){

                              },
                              child: Text("Chat On Whatsapp",style:TextStyle(
                                  color: Colors.white70
                              ),)
                          ),
                          ],
                         ),
                         ),
                        ],
                       ),
                      ),
                    Container(
                      color: Colors.white,
                      height: h,
                      width: w,
                      child: Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Image(image: AssetImage("images/snowpark-home-icon1.png")),
                          Text("Training",
                            style:TextStyle(
                              fontSize: 30,
                              color: Colors.blue.shade900,
                              fontWeight: FontWeight.bold
                            ),
                          ),
                          Text("You are trained under Suffix E Solutions working professionals, on-the-job training model",
                          textAlign: TextAlign.center ,
                          style: TextStyle(
                          ),
                          ),
                          Image(image: AssetImage("images/snowpark-home-icon2.png")),
                          Text("Internship",
                            style:TextStyle(
                                fontSize: 30,
                                color: Colors.blue.shade900,
                                fontWeight: FontWeight.bold
                            ),
                          ),
                          Text("After course completion, you will be proceeded to live projects with a 6 months experience certificate",
                            textAlign: TextAlign.center ,
                            style: TextStyle(
                            ),
                          ),
                          Image(image: AssetImage("images/snowpark-home-icon3.png")),
                          Text("Grooming",
                            style:TextStyle(
                                fontSize: 30,
                                color: Colors.blue.shade900,
                                fontWeight: FontWeight.bold
                            ),
                          ),
                          Text("CV Preparation, Interview Preparation and Personality Development",
                            textAlign: TextAlign.center ,
                            style: TextStyle(
                            ),
                          ),
                          Image(image: AssetImage("images/snowpark-home-icon4.png")),
                          Text("Placement",
                            style:TextStyle(
                                fontSize: 30,
                                color: Colors.blue.shade900,
                                fontWeight: FontWeight.bold
                            ),
                          ),
                          Text("Gives 100% FREE placement support to all our fellow techies through  SCOPE INDIA'S Placement Cell",
                            textAlign: TextAlign.center ,
                            style: TextStyle(
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: h/15),
                    Container(
                      alignment: Alignment.center,
                      height: h/1.8,
                      width: w,
                      color: Colors.blue.shade900,
                      child: Column(
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
                          ), Text("TRAINED EVERY YEAR",
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
                        ],
                      ),
                    ),
                    Container(
                      color: Colors.blue.shade900,
                      height: h/4,
                        width: w,
                        child: Column(
                          children: [
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
                          ],
                        ),
                    ),
                    Container(
                      color: Colors.blue.shade900,
                      height: h/5,
                      width: w,
                      child: Column(
                        children: [
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
                        ],
                      ),
                    ),
                    Container(
                      width: w,
                       color: Colors.blue.shade900,
                      child: Column(
                        children: [
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
                  ]
          )
          ),
        );
  }

}



