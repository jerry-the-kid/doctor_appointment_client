import 'package:flutter/material.dart';

class FullButton extends StatelessWidget {
  final String text;

  const FullButton({
    super.key,
    required this.text,
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
        onPressed: () {},
        child: Text(
          text,
          style: const TextStyle(fontSize: 16, color: Colors.white),
        ));
  }
}
