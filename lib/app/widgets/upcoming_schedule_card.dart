import 'package:doctor_appointment_client/constants/app_colors.dart';
import 'package:flutter/material.dart';

class UpcomingScheduleCard extends StatelessWidget {
  const UpcomingScheduleCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(18.0),
        color: AppColors.primaryColor,
      ),
      padding: const EdgeInsets.all(20),
      child: Column(children: [
        Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10), // Image border
              child: SizedBox.fromSize(
                size: const Size.fromRadius(25), // Image radius
                child: Image.asset('assets/images/doctor.jpg',
                    alignment: Alignment.topCenter, fit: BoxFit.cover),
              ),
            ),
            const SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Dr. Anna Baker",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 19,
                      fontWeight: FontWeight.w500),
                ),
                Text(
                  "MBBS, FPCS (Cardiologist)",
                  style: Theme.of(context).textTheme.bodySmall,
                )
              ],
            )
          ],
        ),
        const SizedBox(height: 15),
        Container(
          padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
          decoration: BoxDecoration(
              color: AppColors.primaryColorDark,
              borderRadius: BorderRadius.circular(7.0)),
          child: const Row(
            children: [
              Icon(
                Icons.calendar_month_outlined,
                color: AppColors.gray_1,
                size: 22,
              ),
              SizedBox(
                width: 5,
              ),
              Text(
                "Tuesday, July 22",
                style: TextStyle(color: Colors.white),
              ),
              Spacer(),
              Icon(
                Icons.access_time_rounded,
                color: AppColors.gray_1,
                size: 22,
              ),
              SizedBox(
                width: 5,
              ),
              Text(
                "11:00 - 12:00 AM",
                style: TextStyle(color: Colors.white),
              )
            ],
          ),
        )
      ]),
    );
  }
}
