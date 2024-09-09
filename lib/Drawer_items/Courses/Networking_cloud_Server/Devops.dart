import 'package:flutter/material.dart';
class Devops extends StatefulWidget {
  const Devops({super.key});

  @override
  State<Devops> createState() => _DevopsState();
}

class _DevopsState extends State<Devops> {
  @override
  Widget build(BuildContext context) {
    var h=MediaQuery.of(context).size.height;
    var w= MediaQuery.of(context).size.width;
    return Scaffold(
      drawer: Drawer(),
      appBar: AppBar(
        backgroundColor: Colors.blue.shade900,
        centerTitle: true,
        title: Image(
            height: h/11,
            width: w/7,
            image:AssetImage("images/scope-india-logo-bird.png") ),
      ),
      body:  Text(
        "This is the Devops page",
        style: TextStyle(
            fontSize: 30,
            color:Colors.black
        ),
      ),

    );
  }
}
