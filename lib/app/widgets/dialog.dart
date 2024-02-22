import 'package:doctor_appointment_client/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class MessageDialog extends StatelessWidget {
  final String title;
  final String message;
  final String? primaryButtonText;
  final String? secondaryButtonText;
  final VoidCallback? primaryButtonCallback;
  final VoidCallback? secondaryButtonCallback;
  final String status;

  const MessageDialog(this.status,
      {super.key,
      required this.title,
      required this.message,
      this.primaryButtonText,
      this.secondaryButtonText,
      this.primaryButtonCallback,
      this.secondaryButtonCallback});

  @override
  Widget build(BuildContext context) {
    Widget svgPicture = SvgPicture.asset(
      'assets/images/check-circle.svg',
      height: 120,
    );

    if (status == 'info') {
      svgPicture = SvgPicture.asset(
        'assets/images/info-circle.svg',
        height: 120,
      );
    }

    return Dialog(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0)), //this right here
      child: Container(
        padding: const EdgeInsets.all(20),
        width: 300.0,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            svgPicture,
            const SizedBox(
              height: 20,
            ),
            Text(
              title,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              message,
              textAlign: TextAlign.center,
            ),
            if (primaryButtonText != null)
              Column(
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.primaryColor,
                          foregroundColor: Colors.white),
                      onPressed: primaryButtonCallback,
                      child: Text(primaryButtonText!),
                    ),
                  ),
                ],
              ),
            if (secondaryButtonText != null)
              Column(
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: secondaryButtonCallback,
                      child: Text(secondaryButtonText!),
                    ),
                  )
                ],
              )
          ],
        ),
      ),
    );
  }
}
