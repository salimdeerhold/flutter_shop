import 'package:flutter/material.dart';
import 'package:flutter_proj_06/pages/cart_page.dart';
import 'package:flutter_proj_06/pages/category_page.dart';
import 'package:flutter_proj_06/pages/home_page.dart';

class BottomNavigationPage extends StatefulWidget {
  const BottomNavigationPage({Key? key}) : super(key: key);

  @override
  State<BottomNavigationPage> createState() => _BottomNavigationPageState();
}

class _BottomNavigationPageState extends State<BottomNavigationPage> {
  int _selectedIndex = 0;
  List pageList =[
    const HomePage(),
    const CategoryPage(),
    const CartPage(),
    Container(color: Colors.greenAccent,),
    // Container(color: Colors.lightGreenAccent,),
  ];
  void onTapped(int index){
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pageList[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        items:const [
          BottomNavigationBarItem(icon: Icon(Icons.home,),label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.list),label: 'Category'),
          BottomNavigationBarItem(icon: Icon(Icons.shopping_cart),label: 'Cart'),
          BottomNavigationBarItem(icon: Icon(Icons.settings),label: 'Setting'),
        ],
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.black26,
        currentIndex: _selectedIndex,
        onTap: onTapped,
      ),
    );
;
  }
}
