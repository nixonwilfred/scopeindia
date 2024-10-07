

import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:scopeindia/Drawer_items/Profile/Alertbox.dart';
import 'package:scopeindia/Login/Loginpage.dart';




class UserDetailPage extends StatefulWidget {
  @override
  State<UserDetailPage> createState() => _UserDetailPageState();
}

class _UserDetailPageState extends State<UserDetailPage> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _mobileNoController = TextEditingController();
  final TextEditingController _date_of_birthController = TextEditingController();



  @override
  Widget build(BuildContext context) {
    final User? user = FirebaseAuth.instance.currentUser;

    if (user == null) {
      return SafeArea(
        child: Scaffold(
          body: Center(
              child: Column(mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("You aren't logged in",
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold
              ),),
              ElevatedButton(
                child:Text("Log in"),
                  onPressed:() {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Loginpage(),));

              }
              ),
            ],
          )),
        ),
      );
    }
    Future<void> _signOut() async {
      await _auth.signOut();
    }

    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text("Profile ",
          style: TextStyle(
            fontSize: 20,
            color: Colors.black87,
            fontWeight: FontWeight.bold

          ),),

        ),

      ),
      body: FutureBuilder<DocumentSnapshot>(
        future: FirebaseFirestore.instance.collection('user_master').doc(user.uid).get(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }

          if (!snapshot.hasData || !snapshot.data!.exists) {
            return Center(child: Text('User not found'));
          }

          var userData = snapshot.data!;
          _nameController.text=userData['name'];
          _emailController.text = userData['email_id'];
          _mobileNoController.text=userData['mobileNo'];
          _date_of_birthController.text=userData['date of birth'];




          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(25.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  TextField(
                    controller: _nameController,
                    decoration: InputDecoration(labelText: 'Name'),
                  ),
                  TextField(
                    controller: _emailController,
                    decoration: InputDecoration(labelText: 'Email'),
                  ),
                  TextField(
                    controller: _mobileNoController,
                    decoration: InputDecoration(labelText: 'password'),
                  ),
                  TextField(
                    controller: _date_of_birthController,
                    decoration: InputDecoration(labelText: 'D.O.B'),
                  ),

                  SizedBox(height: 20),
                  Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ElevatedButton(
                      onPressed: () => showDialog<String>(
                      context: context,
                        builder: (BuildContext context) => AlertDialog(
                title: const Text('Confirm edit?',
                  style: TextStyle(
                  fontSize: 20
                ),
                ),
                          actions: <Widget>[
                  TextButton(
                    child: const Text("Yes"),
                    onPressed:(){
                      setState(()  async {
                        try{
                          await FirebaseFirestore.instance.collection('user_master').doc(user.uid).update({
                            'name': _nameController.text,
                            'email_id': _emailController.text,
                            'mobileNo': _mobileNoController.text,
                            'date of birth': _date_of_birthController.text,
                          });
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("User updated successfully!")));
                        } catch (e) {
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Failed to update user: $e")));
                        }
                        Navigator.pop(context);
                      });
            }

                  ),
                  TextButton(
                    onPressed: () => Navigator.pop(context),
                    child: const Text('Cancel'),
                  ),
                ],
              ),
            ),
            child: const Text(' Edit'),
            ),

                      // ElevatedButton(
                      //     onPressed: (){
                      //       setState(() {
                      //         _signOut();
                      //         Navigator.push(context, MaterialPageRoute(builder: (context) => Loginpage(),));
                      //       });
                      //
                      //     },
                      //     child: Text("Log Out")),
                      ElevatedButton(
                        onPressed: () => showDialog<String>(
                          context: context,
                          builder: (BuildContext context) => AlertDialog(
                            title: const Text('Confirm Log Out?',
                              style: TextStyle(
                                  fontSize: 20
                              ),
                            ),
                            actions: <Widget>[
                              TextButton(
                                  child: const Text("Yes"),
                                  onPressed:(){
                                    _signOut();
                                    Navigator.push(context, MaterialPageRoute(builder: (context) => Loginpage(),));

                                  }

                              ),
                              TextButton(
                                onPressed: () => Navigator.pop(context),
                                child: const Text('Cancel'),
                              ),
                            ],
                          ),
                        ),
                        child: const Text(' Log Out'),
                      ),

                    ],
                  ),

                ],
              ),
            ),
          );/**/
        },
      ),
    );
  }
}



