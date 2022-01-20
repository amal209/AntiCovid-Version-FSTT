import 'package:flutter/material.dart';

class Counter extends StatelessWidget {
  final String title;
  final Color color;
  final int number;

  Counter({required this.title, required this.color, required this.number});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          padding: const EdgeInsets.all(7.0),
          decoration: BoxDecoration(
              color: color.withOpacity(.26), shape: BoxShape.circle),
          child: Container(
            padding: const EdgeInsets.all(4.0),
            decoration: BoxDecoration(
                border: Border.all(color: color, width: 2.5),
                shape: BoxShape.circle),
            child: SizedBox(),
          ),
        ),
        SizedBox(
          height: 15,
        ),
        Text(
          '$number',
          style: TextStyle(
              fontSize: 40, fontWeight: FontWeight.w600, color: color),
        ),
        Text(
          '$title',
          style: TextStyle(color: Colors.grey),
        )
      ],
    );
  }
}
