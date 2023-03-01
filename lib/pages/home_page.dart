import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  bool light = false;
  bool invertor = false;
  
  @override
  Widget build(BuildContext context) {
    debugPrint('buid: Homepage');

    return Scaffold(
      appBar: AppBar(),
      body: Container(
         height: 600,
        width: double.infinity,
        color:Colors.amber,
        child: Column(
          children: [
            Text('welcome'),
            
          ],
        ),
      ),
      
    );
  }
}

