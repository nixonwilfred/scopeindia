import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:scopeindia/Fixed.dart';
import 'package:scopeindia/Drawer_items/Scopeindia.dart';
import 'package:scopeindia/Login/Registeration.dart';
import 'package:scopeindia/firebase_options.dart';

import 'Login/Loginpage.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options:DefaultFirebaseOptions.currentPlatform);


  runApp(
MaterialApp(
    debugShowCheckedModeBanner: false,
    home:Loginpage() )

  );


}

//
// import 'package:flutter/material.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart'; // Import Firebase Auth
//
// import 'Update.dart';
//
// class Profile extends StatefulWidget {
//   const Profile({Key? key}) : super(key: key);
//
//   @override
//   State<Profile> createState() => _ProfileState();
// }
//
// class _ProfileState extends State<Profile> {
//   final FirebaseFirestore _firestore = FirebaseFirestore.instance;
//   final FirebaseAuth _auth = FirebaseAuth.instance; // Initialize Firebase Auth
//   final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
//   Map<String, dynamic>? userData; // To store the current user's data
//
//   @override
//   void initState() {
//     super.initState();
//     _refreshData(); // Fetch current user's data when the widget initializes
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: Scaffold(
//         key: _scaffoldKey,
//         appBar: AppBar(
//           title: Center(child: Text("User Profile")),
//         ),
//         body: userData != null
//             ? Padding(
//           padding: EdgeInsets.symmetric(vertical: 5),
//           child: Card(
//             child: ListTile(
//               title: Text(userData!['name'] ?? 'No Name'),
//               subtitle: Text(userData!['email_id'] ?? 'No Email'),
//               trailing: IconButton(
//                 icon: Icon(Icons.edit),
//                 onPressed: () {
//                   Navigator.push(
//                     context,
//                     MaterialPageRoute(
//                       builder: (context) => UpdateUsers(userData: userData!),
//                     ),
//                   );
//                 },
//               ),
//             ),
//           ),
//         )
//             : Center(child: CircularProgressIndicator()), // Show a loading spinner while fetching data
//       ),
//     );
//   }
//
//   Future<void> _refreshData() async {
//     try {
//       // Get the currently logged-in user
//       User? currentUser = _auth.currentUser;
//
//       if (currentUser != null) {
//         // Fetch the user's data from Firestore
//         final docSnapshot = await _firestore.collection('user_master').doc(currentUser.uid).get();
//
//         if (docSnapshot.exists) {
//           setState(() {
//             userData = docSnapshot.data() as Map<String, dynamic>; // Store the user data
//           });
//         } else {
//           // Handle user not found case
//           ScaffoldMessenger.of(context).showSnackBar(SnackBar(
//             content: Text('User data not found!'),
//           ));
//         }
//       } else {
//         // Handle user not logged in case
//         ScaffoldMessenger.of(context).showSnackBar(SnackBar(
//           content: Text('No user is currently logged in!'),
//         ));
//       }
//     } catch (e) {
//       // Show an error message
//       ScaffoldMessenger.of(context).showSnackBar(SnackBar(
//         content: Text('Error fetching user data: $e'),
//       ));
//     }
//   }
// }
//
//
