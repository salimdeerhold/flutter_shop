import 'package:flutter/material.dart';

class CardWithIconNText extends StatelessWidget {
  const CardWithIconNText({Key? key, this.icon, this.text, this.padding = 4})
      : super(key: key);

  final IconData? icon;
  final String? text;
  final double padding;
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(0),
      child: Padding(
        padding: EdgeInsets.all(padding),
        child: Row(
          children: [
            Icon(
              icon,
              color: Colors.yellow,
            ),
            Text('$text'),
          ],
        ),
      ),
    );
  }
}
