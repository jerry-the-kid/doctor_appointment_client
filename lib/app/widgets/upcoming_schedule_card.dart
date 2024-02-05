import 'package:doctor_appointment_client/constants/app_colors.dart';
import 'package:flutter/material.dart';

class UpcomingScheduleCard extends StatelessWidget {
  final bool isActive;
  final bool isPast;

  const UpcomingScheduleCard(
      {super.key, this.isActive = false, this.isPast = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(18.0),
        color: isActive
            ? AppColors.primaryColor
            : const Color.fromARGB(255, 235, 240, 251),
      ),
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
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
                  Text(
                    "Dr. Anna Baker",
                    style: TextStyle(
                        color: isActive ? Colors.white : Colors.black,
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
                color: isActive ? AppColors.primaryColorDark : Colors.grey[50],
                borderRadius: BorderRadius.circular(7.0)),
            child: Row(
              children: [
                const Icon(
                  Icons.calendar_month_outlined,
                  color: AppColors.gray_1,
                  size: 22,
                ),
                const SizedBox(
                  width: 5,
                ),
                Text(
                  "Tuesday, July 22",
                  style:
                      TextStyle(color: isActive ? Colors.white : Colors.black),
                ),
                const Spacer(),
                const Icon(
                  Icons.access_time_rounded,
                  color: AppColors.gray_1,
                  size: 22,
                ),
                const SizedBox(
                  width: 5,
                ),
                Text(
                  "11:00 - 12:00 AM",
                  style:
                      TextStyle(color: isActive ? Colors.white : Colors.black),
                )
              ],
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          Row(
            children: [
              Expanded(
                  child: ElevatedButton(
                      onPressed: () {},
                      child: Text(isPast ? 'Re-Book' : 'Cancel'))),
              const SizedBox(width: 10),
              Expanded(
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.orange,
                          foregroundColor: Colors.white),
                      onPressed: () {},
                      child: Text(isPast ? 'Add Review' : "Reschedule")))
            ],
          ),
        ],
      ),
    );
  }
}
