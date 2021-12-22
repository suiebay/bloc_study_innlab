import 'package:flutter/material.dart';

class CustomSquareWidget extends StatelessWidget {
  final String title;

  const CustomSquareWidget({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 100,
        width: 100,
        color: Colors.red,
        child: Center(
          child: Text(
            title,
            style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
                color: Colors.blue
            ),
          ),
        )
    );
  }
}
