import 'package:doctor_appointment_client/constants/app_colors.dart';
import 'package:flutter/material.dart';

class DividedButton extends StatelessWidget {
  const DividedButton({
    super.key,
    required this.firstButtonTitle,
    required this.secondButtonTitle,
  });

  final String firstButtonTitle;
  final String secondButtonTitle;

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
            child: SizedBox(
                child: ElevatedButton(
                    onPressed: () {},
                    child: Text(
                      firstButtonTitle,
                      style: const TextStyle(
                          color: AppColors.black, fontWeight: FontWeight.bold),
                    ))),
          ),
          const SizedBox(
            width: 5,
          ),
          Expanded(
            child: SizedBox(
                child: TextButton(
                    onPressed: () {},
                    style: TextButton.styleFrom(
                        backgroundColor: AppColors.gray_3,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8))),
                    child: Text(
                      secondButtonTitle,
                      style: const TextStyle(
                          color: AppColors.black, fontWeight: FontWeight.bold),
                    ))),
          ),
        ],
      ),
    );
  }
}
