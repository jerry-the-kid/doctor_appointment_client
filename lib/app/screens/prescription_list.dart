import 'package:doctor_appointment_client/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class PrescriptionList extends StatelessWidget {
  const PrescriptionList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Prescriptions"),
      ),
      body: const Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            PrescriptionItem(),
            PrescriptionItem(),
            PrescriptionItem(),
          ],
        ),
      ),
    );
  }
}

class PrescriptionItem extends StatelessWidget {
  const PrescriptionItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        context.push("/prescription/2");
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 15),
        margin: const EdgeInsets.only(bottom: 20),
        decoration: BoxDecoration(
            border: Border.all(), borderRadius: BorderRadius.circular(8)),
        child: Column(
          children: [
            const Row(
              children: [
                Expanded(
                  child: Text(
                    'Khám Răng Hàm Mặt',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        color: AppColors.primaryColor),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "APPOINTMENT DATE",
                        style: TextStyle(
                            fontSize: 10,
                            color: Colors.grey[600],
                            letterSpacing: 1.2),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        "April 18, 2023",
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Colors.grey[800]),
                      )
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "DOCTOR",
                        style: TextStyle(
                            fontSize: 10,
                            color: Colors.grey[600],
                            letterSpacing: 1.2),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        "DR. Robert Dwayne",
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Colors.grey[800]),
                      )
                    ],
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
