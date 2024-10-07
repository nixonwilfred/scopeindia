import 'dart:math';

import 'package:flutter/material.dart';
import 'dart:convert';
 import 'package:http/http.dart' as http;

class UserProfile {
  final String firstName;
  final String lastName;
  final String email;
  final String phone;
  final String picture;
  final String designation;
  final String company;
  final String course;

  UserProfile({
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.phone,
    required this.picture,
    required this.designation,
    required this.company,
    required this.course,
  });
}

class MultipleUsersScreen extends StatefulWidget {
  @override
  _MultipleUsersScreenState createState() => _MultipleUsersScreenState();
}

class _MultipleUsersScreenState extends State<MultipleUsersScreen> {
  List users = [];
  bool isLoading = true;

  // Custom lists for designations, companies, and courses
  List<String> designations = ['Software Engineer', 'Project Manager', 'Data Scientist', 'UX Designer', 'Product Owner'];
  List<String> companies = ['Google', 'Microsoft', 'Apple', 'Amazon', 'Facebook'];
  List<String> courses = ['Flutter Development', 'Data Analysis', 'UI/UX Design', 'Cloud Computing', 'AI and Machine Learning'];

  @override
  void initState() {
    super.initState();
    fetchUsers();
  }

  // Function to fetch users from the Random User API
  Future<void> fetchUsers() async {
    final response = await http.get(Uri.parse('https://randomuser.me/api/?results=10'));

    if (response.statusCode == 200) {
      List data = jsonDecode(response.body)['results'];

      // Assign random designations, companies, and courses to each user
      var random = Random();
      for (var user in data) {
        user['designation'] = designations[random.nextInt(designations.length)];
        user['company'] = companies[random.nextInt(companies.length)];
        user['courses'] = courses[random.nextInt(courses.length)];
      }
      setState(() {
        users = data;
        isLoading = false;
      });
    }
    else {
      throw Exception('Failed to load users');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("Placement Cell",
        style: TextStyle(
          color: Colors.black87,
          // fontWeight: FontWeight.bold,
          fontFamily: "Roboto"
        ),)),
      ),
      body: isLoading
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
        itemCount: users.length,
        itemBuilder: (context, index) {
          var user = users[index];
          return Padding(
            padding: const EdgeInsets.all(15.0),
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(12),
              ),
              padding: EdgeInsets.all(16),
              child: Column(
                children: <Widget>[
                  // Displaying the larger image in a Container
                  Container(
                    height: 200,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(user['picture']['large']),
                      ),
                    ),
                  ),

                  SizedBox(height: 16),

                  // Displaying the user details below the image
                  Text(
                    '${user['name']['first']} ${user['name']['last']}',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
                  SizedBox(height: 8),
                  Text('Designation: ${user['designation']}', style: TextStyle(fontSize: 16)),
                  Text('Company: ${user['company']}', style: TextStyle(fontSize: 16)),
                  Text('Course: ${user['courses']}', style: TextStyle(fontSize: 16)),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}