import 'package:flutter/material.dart';

class But extends StatelessWidget {
  final Function() onPressed;
  final String text;

  final Color color;

  const But(
      {required this.onPressed,
      required this.text,
      required this.color,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      width: 300,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(20),
      ),
      child: TextButton(
        onPressed: onPressed,
        child: Text(
          text,
          style: const TextStyle(
            fontSize: 20,
            color: Colors.grey,
          ),
        ),
      ),
    );
  }
}
