import 'package:flutter/material.dart';

class Alertbox extends StatefulWidget {
  const Alertbox({super.key});

  @override
  State<Alertbox> createState() => _AlertboxState();
}

class _AlertboxState extends State<Alertbox> {
  @override
  Widget build(BuildContext context) {
    return  AlertDialog(
      title: Text("Dialog Title"),
      content: Text("This is a simple pop-up message."),
      actions: <Widget>[
        TextButton(
          child: Text("OK"),
          onPressed: () {
            Navigator.of(context).pop(); // Close the dialog
          },
        ),
      ],
    );
//       import 'package:flutter/material.dart';
//
//     void main() {
//       runApp(MyApp());
//     }
//
//     class MyApp extends StatelessWidget {
//     @override
//     Widget build(BuildContext context) {
//     return MaterialApp(
//     home: HomeScreen(),
//     );
//     }
//     }
//
//     class HomeScreen extends StatelessWidget {
//     void _showDialog(BuildContext context) {
//     showDialog(
//     context: context,
//     builder: (BuildContext context) {
//     return AlertDialog(
//     title: Text("Dialog Title"),
//     content: Text("This is a simple pop-up message."),
//     actions: <Widget>[
//     TextButton(
//     child: Text("OK"),
//     onPressed: () {
//     Navigator.of(context).pop(); // Close the dialog
//     },
//     ),
//     ],
//     );
//     },
//     );
//     }
//
//     @override
//     Widget build(BuildContext context) {
//     return Scaffold(
//     appBar: AppBar(
//     title: Text("Pop-Up Message Example"),
//     ),
//     body: Center(
//     child: ElevatedButton(
//     child: Text("Show Dialog"),
//     onPressed: () => _showDialog(context),
//     ),
//     ),
//     );
//     }
//     }
//     ();
  }
}
