import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SelectAppointmentDialog extends StatelessWidget {
  const SelectAppointmentDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 25),
        child: SizedBox(
          child: Wrap(
            runSpacing: 10,
            children: [
              const Text(
                "What is you want to booking for ?",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 20,
              ),
              AppointmentSelection(
                prefixIcon: Icons.health_and_safety,
                title: "Schedule health check up",
                message:
                    "Schedule your health check-up with ease, ensuring your well-being is a top priority",
                selectAppointmentCallback: () {
                  context.pop();
                  context.push('/checkup');
                },
              ),
              AppointmentSelection(
                prefixIcon: Icons.people_alt,
                title: "Doctor consultation booking",
                message:
                    "Book appointments with qualified doctors swiftly, addressing your healthcare needs efficiently.",
                selectAppointmentCallback: () {
                  context.pop();
                  context.push('/doctors');
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}

class AppointmentSelection extends StatelessWidget {
  final String title;
  final String message;
  final IconData prefixIcon;
  final VoidCallback selectAppointmentCallback;

  const AppointmentSelection(
      {super.key,
      required this.title,
      required this.message,
      required this.prefixIcon,
      required this.selectAppointmentCallback});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      // onTap: () {
      // context.push('/checkup');
      // },
      onTap: selectAppointmentCallback,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 10),
        decoration: BoxDecoration(
            border: Border.all(), borderRadius: BorderRadius.circular(8)),
        child: Row(
          children: [
            Icon(
              prefixIcon,
              size: 42,
            ),
            const SizedBox(
              width: 10,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 2,
                  ),
                  Text(
                    message,
                    style: Theme.of(context)
                        .textTheme
                        .bodySmall!
                        .copyWith(fontSize: 12, height: 1.1),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
