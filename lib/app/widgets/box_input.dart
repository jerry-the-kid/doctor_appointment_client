import 'package:doctor_appointment_client/constants/app_colors.dart';
import 'package:flutter/material.dart';

class BoxInput extends StatelessWidget {
  const BoxInput({super.key, required this.label, this.obscure = false});

  final String label;
  final bool obscure;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(12, 6, 12, 12),
      decoration: BoxDecoration(
        border: Border.all(
          color: AppColors.gray_1, // Set the border color
          width: 1.0, // Set the border width
        ),
        borderRadius: BorderRadius.circular(5.0), // Set the border radius
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: const TextStyle(color: AppColors.gray_1, fontSize: 12),
          ),
          const SizedBox(height: 8),
          TextField(
            obscureText: obscure,
            decoration: const InputDecoration(
              border: InputBorder.none,
              isDense: true,
              contentPadding: EdgeInsets.zero,
              // border: OutlineInputBorder(
              //     borderRadius: BorderRadius.circular(5)),
            ),
          )
        ],
      ),
    );
  }
}
