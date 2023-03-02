

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Try extends StatelessWidget {
  var colorList = [
    Colors.green,
    Colors.red,
    Colors.amber,
    Colors.blueGrey,
    Colors.indigo,
    Colors.green,
    Colors.red,
    Colors.amber,
    Colors.blueGrey,
    Colors.indigo,

  ];

  Try({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: 10,
      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 180,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
        mainAxisExtent:200,

       
  )
      , itemBuilder: (context,index){
        return Container(color: colorList[index],
        height: 200,
        width: 500,);
      });
  }
}

/*
SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 200,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
        childAspectRatio: 2.5/3

      )
*/ 