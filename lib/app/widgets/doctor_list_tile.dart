import 'package:doctor_appointment_client/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class DoctorListTile extends StatelessWidget {
  const DoctorListTile({
    super.key,
    this.isListTile = true,
  });

  final bool isListTile;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.push('/doctors/1');
      },
      child: Container(
        padding:
            EdgeInsets.symmetric(vertical: 15, horizontal: isListTile ? 20 : 0),
        decoration: BoxDecoration(
          color: !isListTile
              ? Colors.white
              : const Color.fromARGB(255, 235, 240, 251),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10), // Image border
              child: SizedBox.fromSize(
                size: const Size.fromRadius(40), // Image radius
                child: Image.asset('assets/images/doctor.jpg',
                    alignment: Alignment.topCenter, fit: BoxFit.cover),
              ),
            ),
            const SizedBox(width: 20),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Dr. Arlene McCoy",
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium!
                      .copyWith(fontWeight: FontWeight.bold),
                ),
                Text(
                  "MBBS, FPCS (Pediastrics)",
                  style: Theme.of(context)
                      .textTheme
                      .bodySmall!
                      .copyWith(fontWeight: FontWeight.w500),
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    const Icon(
                      Icons.star,
                      color: AppColors.orange,
                      size: 18,
                    ),
                    const SizedBox(width: 2),
                    Text(
                      "4.6",
                      style: Theme.of(context)
                          .textTheme
                          .bodySmall!
                          .copyWith(fontWeight: FontWeight.w500),
                    ),
                    const SizedBox(width: 20),
                    Text(
                      '150 reviews',
                      style: Theme.of(context)
                          .textTheme
                          .bodySmall!
                          .copyWith(fontWeight: FontWeight.w500),
                    )
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
