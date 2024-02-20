import 'package:flutter/material.dart';

class Input extends StatelessWidget {
  final String label;
  final String placeholder;
  final String? Function(String?)? validator;
  final TextInputType inputType;
  final TextEditingController? controller;
  final void Function(String)? onChanged;
  final bool? enabled;

  const Input({
    super.key,
    required this.label,
    required this.validator,
    this.controller,
    this.onChanged,
    this.placeholder = '',
    this.inputType = TextInputType.text,
    this.enabled = true,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: const TextStyle(fontSize: 14)),
        const SizedBox(
          height: 8,
        ),
        TextFormField(
          enabled: enabled,
          onChanged: onChanged,
          controller: controller,
          keyboardType: inputType,
          decoration: InputDecoration(
            hintText: placeholder,
            hintStyle: const TextStyle(fontSize: 14),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          validator: validator,
        )
      ],
    );
  }
}
