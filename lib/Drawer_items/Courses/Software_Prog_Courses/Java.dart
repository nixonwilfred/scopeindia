import 'package:flutter/material.dart';

import '../../Courses.dart';

class Java extends StatefulWidget {
  const Java({super.key});

  @override
  State<Java> createState() => _JavaState();
}

class _JavaState extends State<Java> {
  onBackpressed(didPop){
    if(didPop){
      return;
    }
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    var h=MediaQuery.of(context).size.height;
    var w= MediaQuery.of(context).size.width;

    return  PopScope(canPop:false,
        onPopInvoked: (didPop) {
          onBackpressed(didPop);
        },
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("images/snowpark-mount.jpg",
              ),
            fit: BoxFit.cover)
          ),
          child: Scaffold(backgroundColor: Colors.transparent,
            body:
            Padding(

              padding: const EdgeInsets.all(20.0),
              child: Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly,

                    children: [ Text("Java Full Stack \n Internship  ",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                      color: Colors.yellow.shade700,
                      fontFamily: "Roboto",
                    ),
                    ),


                  Text("All Trainers at SCOPE INDIA are working professionals, Software Engineers, Networking Engineers, and Software \n Test Engineers of Suffix E Solutions with ",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize:12,
                    ),
                    textAlign: TextAlign.center,),
                  //

                      Text("17 years of Industrial experience",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Colors.yellow.shade800,
                          fontFamily: "Roboto",
                        ),
                      textAlign: TextAlign.center,),
                  //
                      Container(
                        width: w/1.4,
                          height: w/6,
                          decoration: BoxDecoration(
                            border: Border.all(
                              color:Colors.green.shade300
                            )
                          ),



                          child: Padding(
                            padding: const EdgeInsets.all(8),
                            child: Text("4 months course +\n"
                                "3 months on the Job Training",
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontFamily: "Oswald",
                                fontSize: 15
                              ),
                              textAlign: TextAlign.center,),
                          ),
                        ),

                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                              color: Colors.blue)
                        ),
                        child:Column(
                          children: [
                            Text("Next Batches",
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                                fontFamily: "Oswald"
                            ),),
                            Text("26th September 2024:  Thampanoor TVM \n"
                                "10th  October 2024:  Technopark TVM \n"
                                "26th  September 2024: Kochi \n"
                                "30th September 2024: Nagercoil \n"
                                "10th October 2024: Online",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize:12,
                              fontWeight: FontWeight.bold


                            ),
                            textAlign: TextAlign.justify,)
                          ],
                        )
                      )





                ]
              ),
            ),


        )
        )
    );
  }
}





