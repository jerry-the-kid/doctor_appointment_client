import 'package:flutter/material.dart';

class FullButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const FullButton({
    super.key,
    required this.text,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(4),
          ),
          elevation: 0,
          backgroundColor: Theme.of(context).colorScheme.primary,
          // minimumSize: const Size(double.infinity, 50)),
          minimumSize: const Size(double.infinity, 55),
        ),
        onPressed: onPressed,
        child: Text(
          text,
          style: const TextStyle(fontSize: 16, color: Colors.white),
        ));
  }
}
