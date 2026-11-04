import 'package:flutter/material.dart';

import 'home_page.dart';
import 'contact_page.dart';
import 'twitter_page.dart';
import 'about_page.dart';

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
        '/about': (context) => const AboutPage(),
        '/contact': (context) => const ContactPage(),
        '/twitter': (context) => const TwitterPage(),
        '/facebook': (context) =>
            const Scaffold(body: Center(child: Text('Facebook'))),
      },
    );
  }
}
