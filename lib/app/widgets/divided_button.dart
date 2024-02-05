import 'package:doctor_appointment_client/constants/app_colors.dart';
import 'package:flutter/material.dart';

class DividedButton extends StatefulWidget {
  const DividedButton({
    super.key,
    required this.firstButtonTitle,
    required this.secondButtonTitle,
    required this.onChange,
  });

  final String firstButtonTitle;
  final String secondButtonTitle;
  final Function(int) onChange;

  @override
  State<DividedButton> createState() => _DividedButtonState();
}

class _DividedButtonState extends State<DividedButton> {
  int tabValue = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 3, horizontal: 3),
      decoration: BoxDecoration(
          color: AppColors.gray_3, borderRadius: BorderRadius.circular(8)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: ConditionalTabButton(
                isActive: tabValue == 0,
                title: widget.firstButtonTitle,
                onPress: () {
                  setState(() {
                    tabValue = 0;
                  });
                  widget.onChange(0);
                }),
          ),
          const SizedBox(
            width: 5,
          ),
          Expanded(
            child: ConditionalTabButton(
              isActive: tabValue == 1,
              title: widget.secondButtonTitle,
              onPress: () {
                setState(() {
                  tabValue = 1;
                });
                widget.onChange(1);
              },
            ),
          ),
        ],
      ),
    );
  }
}

class ConditionalTabButton extends StatelessWidget {
  final bool isActive;
  final String title;
  final VoidCallback onPress;

  const ConditionalTabButton(
      {super.key,
      required this.isActive,
      required this.title,
      required this.onPress});

  @override
  Widget build(BuildContext context) {
    return isActive
        ? ElevatedButton(
            onPressed: onPress,
            child: Text(
              title,
              style: const TextStyle(
                  color: AppColors.black, fontWeight: FontWeight.bold),
            ),
          )
        : TextButton(
            onPressed: onPress,
            style: TextButton.styleFrom(
                backgroundColor: AppColors.gray_3,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8))),
            child: Text(
              title,
              style: const TextStyle(
                  color: AppColors.black, fontWeight: FontWeight.bold),
            ),
          );
  }
}
