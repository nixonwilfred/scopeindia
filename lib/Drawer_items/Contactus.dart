import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:mailer/mailer.dart';
import 'package:mailer/smtp_server.dart';

class Contactus extends StatelessWidget {
  const Contactus({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: UserForm(),
    );
  }
}



class UserForm extends StatefulWidget {
  @override
  _UserFormState createState() => _UserFormState();
}

class _UserFormState extends State<UserForm> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // Function to send the email
  Future<void> _sendEmail(String name, String email) async {
    String username = 'alexnoha37@gmail.com';  // Your email
    String password = 'loskxafreqmzslns';  // Your email password

    final smtpServer = gmail(username, password);  // Use Gmail's SMTP server

    // Create the message
    final message = Message()
      ..from = Address(username, 'Scope India')
      ..recipients.add(email)  // Recipient's email
      ..subject = 'Welcome to Scope India'
      ..text = 'Hello $name, welcome to our app! We are glad to have you onboard.';

    try {
      final sendReport = await send(message, smtpServer);
      print('Message sent: ' + sendReport.toString());
      ScaffoldMessenger.of(context).showSnackBar(
         SnackBar(content: Text('Email sent successfully!')),
      );
    }
    on MailerException catch (e) {
      print('Message not sent. $e');
      ScaffoldMessenger.of(context).showSnackBar(
         SnackBar(content: Text('Failed to send email.')),
      );
    }
  }

  // Function to handle form submission
  Future<void> _sendData() async {
    String name = _nameController.text;
    String phone = _phoneController.text;
    String email = _emailController.text;

    // Save data to Firestore
    await _firestore.collection('mailer').add({
      'name': name,
      'phone': phone,
      'email': email,
    });

    // Send the email
    await _sendEmail(name, email);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
          title: Center(
              child: Text('User Form')
          )

      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _nameController,
              decoration: InputDecoration(labelText: 'Name'),
            ),
            TextField(
              controller: _phoneController,
              decoration: InputDecoration(labelText: 'Phone Number'),
              keyboardType: TextInputType.phone,
            ),
            TextField(
              controller: _emailController,
              decoration: InputDecoration(labelText: 'Email'),
              keyboardType: TextInputType.emailAddress,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _sendData,
              child: Text('Onboard'),
            ),
          ],
        ),
      ),
    );
  }
}

