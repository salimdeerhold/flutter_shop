import 'package:flutter/material.dart';
import 'package:flutter_proj_06/pages/bottom_navigation_page.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home:const BottomNavigationPage(),
        //Try() 
      ),
    );
  }
}

