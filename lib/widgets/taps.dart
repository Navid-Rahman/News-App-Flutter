import 'package:flutter/material.dart';

class TapsWidget extends StatelessWidget {
  const TapsWidget(
      {super.key,
      required this.text,
      required this.color,
      required this.function,
      required this.fontsize});

  final Color color;
  final double fontsize;
  final Function function;
  final String text;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        function();
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: color,
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            text,
            style: TextStyle(
              fontSize: fontsize,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }
}
