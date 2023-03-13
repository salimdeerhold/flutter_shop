import 'package:flutter/material.dart';

class CustomCircularProgressIndicator extends StatelessWidget {
  const CustomCircularProgressIndicator({Key? key, this.size = 24.0,this.strokeWidth=4.0})
      : super(key: key);
  final double size;
  final double strokeWidth;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: size,
      width: size,
      child: CircularProgressIndicator(
        strokeWidth: strokeWidth,
      ),
    );
  }
}


