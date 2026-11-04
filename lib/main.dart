import 'package:flutter/material.dart';

import 'contact_page.dart';
import 'home_page.dart';
import 'facebook_page.dart';
import 'twitter_page.dart';

void main() {
  runApp(const WOWPizzaApp());
}

class WOWPizzaApp extends StatelessWidget {
  const WOWPizzaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => const HomePage(),
        '/menu': (context) => const Scaffold(body: Center(child: Text('Menu'))),
        '/about': (context) =>
            const Scaffold(body: Center(child: Text('About'))),
        '/contact': (context) => const ContactPage(),
        '/twitter': (context) => const TwitterPage(),
        '/facebook': (context) => const FacebookPage(),
      },
    );
  }
}
