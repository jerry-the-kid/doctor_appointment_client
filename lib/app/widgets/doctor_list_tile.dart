import 'package:doctor_appointment_client/constants/app_colors.dart';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class DoctorListTile extends StatelessWidget {
  final String name;
  final String title;
  final String specialistIn;
  final String avatarUrl;
  final String id;
  final bool isMedicalCheckup;
  final bool isListTile;

  const DoctorListTile({
    super.key,
    required this.name,
    required this.title,
    required this.specialistIn,
    required this.avatarUrl,
    required this.id,
    this.isListTile = true,
    this.isMedicalCheckup = false,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        if (!isListTile) {
          return;
        }

        context.push(
          '/doctors/$id',
        );
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
                child: Image.network(avatarUrl,
                    alignment: Alignment.topCenter, fit: BoxFit.cover),
              ),
            ),
            const SizedBox(width: 20),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "$title $name",
                    style: Theme.of(context)
                        .textTheme
                        .titleMedium!
                        .copyWith(fontWeight: FontWeight.bold),
                  ),
                  Text(
                    specialistIn,
                    style: Theme.of(context)
                        .textTheme
                        .bodySmall!
                        .copyWith(fontWeight: FontWeight.w500),
                  ),
                  SizedBox(height: isMedicalCheckup ? 40 : 10),
                  if (!isMedicalCheckup)
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
              ),
            )
          ],
        ),
      ),
    );
  }
}
