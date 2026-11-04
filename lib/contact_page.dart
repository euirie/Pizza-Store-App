import 'package:flutter/material.dart';

class ContactPage extends StatelessWidget {
  const ContactPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Contact Us')),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'FrostByte Japanese Restaurant',
              style: TextStyle(fontSize: 30),
            ),
            SizedBox(height: 20),
            Text('Address: Metrocity, Kuching'),
            Text('Phone: +60 12-676 7676'),
            Text('Email: pizza@frostbyte.com'),
          ],
        ),
      ),
    );
  }
}
