import 'package:flutter/material.dart';

import 'home_page.dart';
import 'contact_page.dart';
import 'facebook_page.dart';
import 'twitter_page.dart';
import 'about_page.dart';
import 'screens/menu.dart';

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
        '/menu': (context) => MenuPage(),
        '/about': (context) => const AboutPage(),
        '/contact': (context) => const ContactPage(),
        '/twitter': (context) => const TwitterPage(),
        '/facebook': (context) => const FacebookPage(),
      },
    );
  }
}
