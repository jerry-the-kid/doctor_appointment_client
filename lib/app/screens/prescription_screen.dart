import 'package:doctor_appointment_client/app/widgets/no_item_note.dart';
import 'package:doctor_appointment_client/app/widgets/table_cell_custom.dart';
import 'package:doctor_appointment_client/constants/helpers.dart';
import 'package:doctor_appointment_client/data/models/medicine_model.dart';
import 'package:doctor_appointment_client/providers/user_provider.dart';

import 'package:doctor_appointment_client/services/prescription_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PrescriptionScreen extends StatelessWidget {
  final String id;
  const PrescriptionScreen({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Prescription')),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: FutureBuilder(
            future: PrescriptionService().getPrescription(prescriptionId: id),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }

              if (snapshot.connectionState == ConnectionState.done &&
                  (snapshot.data == null)) {
                return const NoItemNote(message: "No data found !");
              }

              var prescription = snapshot.data!;
              var user = context.watch<UserProvider>().currentUser!;
              List<MedicineModel> medicines = [];

              for (var medicine in prescription.medicines) {
                medicines.add(MedicineModel.fromJson(medicine));
              }

              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "${prescription.title} ${prescription.doctorName}",
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 20),
                            ),
                            const Text("M.S"),
                            const Text("Reg.No:MMC 2024")
                          ],
                        ),
                      ),
                      const Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "SaiGon General Hospital",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 20),
                            ),
                            Text("AB Main Center, XYZ Road, Pune"),
                            Text("PH : 546556535151, Timing: 7:00 AM - 8:00PM"),
                          ],
                        ),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  const Divider(color: Colors.grey),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    "ID: 11 - PATIENT: ${user.userName.toUpperCase()} (M) / ${user.age} Y Mob. No.: 9423380390",
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 15),
                  ),
                  const Text("Address: PUNE"),
                  Text(
                      "Weight (Kg): ${user.weight}, Height (Cm): ${175} (B.M.I. 20.00), BP: 120/80 mmHg"),
                  const SizedBox(
                    height: 20,
                  ),
                  Table(border: TableBorder.all(), children: [
                    const TableRow(
                      children: [
                        TableCellCustom(
                            content: "Chief Complaints", isTitle: true),
                        TableCellCustom(
                            content: 'Clinical Findings', isTitle: true),
                      ],
                    ),
                    TableRow(
                      children: [
                        TableCellCustom(content: prescription.chiefComplaints),
                        TableCellCustom(content: prescription.clinicalFindings),
                      ],
                    ),
                  ]),
                  const SizedBox(
                    height: 15,
                  ),
                  const Text(
                    "Diagnosis",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                  ),
                  Text(prescription.diagnosis),
                  const SizedBox(
                    height: 15,
                  ),
                  Table(
                    border: TableBorder.all(),
                    children: [
                      const TableRow(
                        children: [
                          TableCellCustom(
                              content: "Medicine Name", isTitle: true),
                          TableCellCustom(content: 'Dosage', isTitle: true),
                          TableCellCustom(content: 'Duration', isTitle: true),
                        ],
                      ),
                      ...medicines.map((medicine) {
                        return TableRow(
                          children: [
                            TableCellCustom(
                                content:
                                    "1) ${medicine.type.toUpperCase()}. ${medicine.name.toUpperCase()}"),
                            TableCellCustom(
                                content: medicine.medicalHours
                                    .map((e) =>
                                        "1 ${Helpers().capitalizeString(e)}")
                                    .join(" ")),
                            TableCellCustom(
                                content:
                                    '${medicine.duration} Days (Tot: ${medicine.medicalHours.length * medicine.duration} ${medicine.type})'),
                          ],
                        );
                      }),
                    ],
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  const Text(
                    "Advice :",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                  ),
                  Text(prescription.advices),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    "Follow Up : 04-09-2023",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
