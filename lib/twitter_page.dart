import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class TwitterPage extends StatefulWidget {
  const TwitterPage({super.key});

  @override
  State<TwitterPage> createState() => _TwitterPageState();
}

class _TwitterPageState extends State<TwitterPage> {
  //create a controller variable
  final WebViewController myController = WebViewController();

  @override
  void initState() {
    super.initState();
    
    //convert the website text into a link format
    final myLink = Uri.parse('https://twitter.com/');
    
    //yell controller to load link
    myController.loadRequest(myLink);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Twitter'),
      ),
      //display the controller 
      body: WebViewWidget(controller: myController),
    );
  }
}