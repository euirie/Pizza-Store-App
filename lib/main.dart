import 'package:flutter/material.dart';
import 'home_page.dart'; // Links your new file

void main() {
  runApp(const WOWPizzaApp());
}

class WOWPizzaApp extends StatelessWidget {
  const WOWPizzaApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => const HomePage(),
        '/menu': (context) => const Scaffold(body: Center(child: Text('Menu'))),
        '/about': (context) => const Scaffold(body: Center(child: Text('About'))),
        '/contact': (context) => const Scaffold(body: Center(child: Text('Contact'))),
        '/twitter': (context) => const Scaffold(body: Center(child: Text('Twitter'))),
        '/facebook': (context) => const Scaffold(body: Center(child: Text('Facebook'))),
      },
    );
  }
}