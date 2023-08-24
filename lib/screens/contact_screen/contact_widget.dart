import 'package:flutter/material.dart';

class ContactForm extends StatefulWidget {
  @override
  State<ContactForm> createState() => _ContactFormState();
}

class _ContactFormState extends State<ContactForm> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 500,
      width: 500,
      margin: EdgeInsets.all(20),
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.8),
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.3),
            spreadRadius: 5,
            blurRadius: 10,
            offset: Offset(0, 3), // Offset in the y-direction for the shadow
          ),
        ],
      ),
      child: Form(
        child: Column(
          children: [
            TextFormField(
              decoration: InputDecoration(labelText: 'Name'),
            ),
            SizedBox(height: 10),
            TextFormField(
              decoration: InputDecoration(labelText: 'Email'),
            ),
            SizedBox(height: 10),
            TextFormField(
              decoration: InputDecoration(labelText: 'Subject'),
            ),
            SizedBox(height: 10),
            TextFormField(
              decoration: InputDecoration(labelText: 'Message'),
              maxLines: 3,
            ),
            SizedBox(height: 50),
            ElevatedButton(
              style: ButtonStyle(
                backgroundColor:
                    MaterialStateProperty.all<Color>(Colors.indigo.shade300),
                // shape: MaterialStateProperty.all<OutlinedBorder>(
                //   RoundedRectangleBorder(
                //     borderRadius: BorderRadius.circular(
                //         0), // Set your desired border radius
                //   ),
                // ),
              ),
              onPressed: () {
                // Add your send message logic here
              },
              child: Text(
                'Send Message',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
