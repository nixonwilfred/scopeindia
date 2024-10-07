import 'package:flutter/material.dart';
class Aws extends StatefulWidget {
  const Aws({super.key});

  @override
  State<Aws> createState() => _AwsState();
}
class _AwsState extends State<Aws> {
  @override
  Widget build(BuildContext context) {
    var h=MediaQuery.of(context).size.height;
    var w= MediaQuery.of(context).size.width;
    return Scaffold(
      body: Text(
        "This is the Aws page",
        style: TextStyle(
          fontSize: 30,
          color:Colors.black
      ),
      ),


    );
  }
}
