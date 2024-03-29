import 'package:doctor_appointment_client/constants/app_colors.dart';
import 'package:flutter/material.dart';

class PrimaryFullBtn extends StatelessWidget {
  final String title;
  final VoidCallback onPressed;

  const PrimaryFullBtn(
      {super.key, required this.title, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(vertical: 20),
              backgroundColor: AppColors.primaryColor,
              foregroundColor: Colors.white),
          onPressed: onPressed,
          child: Text(title)),
    );
  }
}
