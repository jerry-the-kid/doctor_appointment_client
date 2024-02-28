import 'package:doctor_appointment_client/app/widgets/no_item_note.dart';
import 'package:doctor_appointment_client/constants/app_colors.dart';
import 'package:doctor_appointment_client/constants/helpers.dart';
import 'package:doctor_appointment_client/data/models/prescription_model.dart';
import 'package:doctor_appointment_client/services/auth_service.dart';
import 'package:doctor_appointment_client/services/prescription_service.dart';
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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: FutureBuilder(
            future: PrescriptionService()
                .getAllPrescription(userId: Auth().currentUser!.uid),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }

              if (snapshot.connectionState == ConnectionState.done &&
                  (snapshot.data == null || snapshot.data!.isEmpty)) {
                return const NoItemNote(message: "No prescription found !");
              }
              return Column(
                children: snapshot.data!
                    .map((prescription) =>
                        PrescriptionItem(prescription: prescription))
                    .toList(),
              );
            },
          ),
        ),
      ),
    );
  }
}

class PrescriptionItem extends StatelessWidget {
  final PrescriptionModel prescription;

  const PrescriptionItem({
    super.key,
    required this.prescription,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        context.push("/prescription/${prescription.id}");
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 15),
        margin: const EdgeInsets.only(bottom: 20),
        decoration: BoxDecoration(
            border: Border.all(), borderRadius: BorderRadius.circular(8)),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: Text(
                    "Khám ${prescription.specialistIn.split(" ").sublist(1).join(" ")}",
                    style: const TextStyle(
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
                        Helpers().formattedDate(
                            newPattern: "MMMM dd, yyyy",
                            dateTime: prescription.createdDate),
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
                        "${prescription.title} ${prescription.doctorName}",
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
