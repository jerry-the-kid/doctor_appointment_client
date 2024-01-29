import 'package:doctor_appointment_client/constants/app_colors.dart';
import 'package:flutter/material.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 20),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text("Today", style: Theme.of(context).textTheme.headlineMedium),
              TextButton(
                  onPressed: () {},
                  child: Text(
                    "Mark all read",
                    style: Theme.of(context)
                        .textTheme
                        .headlineSmall!
                        .copyWith(color: AppColors.orange),
                  ))
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          const Notification(),
          const Notification(),
          const Notification(),
          const SizedBox(
            height: 30,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text("Today", style: Theme.of(context).textTheme.headlineMedium),
              TextButton(
                  onPressed: () {},
                  child: Text(
                    "Mark all read",
                    style: Theme.of(context)
                        .textTheme
                        .headlineSmall!
                        .copyWith(color: AppColors.orange),
                  ))
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          const Notification(),
          const Notification(),
          const Notification()
        ],
      ),
    );
  }
}

class Notification extends StatelessWidget {
  const Notification({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15),
      child: Row(
        children: [
          Container(
            width: 10.0, // Adjust the width as needed
            height: 10.0, // Adjust the height as needed
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: AppColors.orange,
            ),
          ),
          const SizedBox(
            width: 15,
          ),
          const Icon(
            Icons.notifications_active,
            size: 30,
          ),
          const SizedBox(
            width: 20,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Yo, Your account spotted on new device',
                style: Theme.of(context)
                    .textTheme
                    .headlineSmall!
                    .copyWith(fontSize: 17),
              ),
              Text(
                '10:00 AM',
                style: Theme.of(context).textTheme.bodySmall,
              )
            ],
          )
        ],
      ),
    );
  }
}
