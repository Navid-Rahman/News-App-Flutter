// PaginationButtons.dart
import 'package:flutter/material.dart';

class PaginationButtons extends StatelessWidget {
  final Function() onPreviousPressed;
  final Function() onNextPressed;

  const PaginationButtons({
    Key? key,
    required this.onPreviousPressed,
    required this.onNextPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        ElevatedButton(
          onPressed: onPreviousPressed,
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.blue,
            padding: const EdgeInsets.all(6),
            textStyle: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          child: const Text("Prev"),
        ),
        // Other code for flexible ListView.builder
        ElevatedButton(
          onPressed: onNextPressed,
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.blue,
            padding: const EdgeInsets.all(6),
            textStyle: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          child: const Text("Next"),
        ),
      ],
    );
  }
}
