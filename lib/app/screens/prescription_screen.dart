import 'package:doctor_appointment_client/app/widgets/table_cell_custom.dart';
import 'package:flutter/material.dart';

class PrescriptionScreen extends StatelessWidget {
  const PrescriptionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Prescription')),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Dr.Akshara",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20),
                        ),
                        Text("M.S"),
                        Text("Reg.No:MMC 2024")
                      ],
                    ),
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "SMS hospital",
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
              const Text(
                "ID: 11 - PATIENT: PHAM QUANG HAO (M) / 13 Y Mob. No.: 9423380390",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
              ),
              const Text("Address: PUNE"),
              const Text(
                  "Weight (Kg): 80, Height (Cm): 200 (B.M.I. 20.00), BP: 120/80 mmHg"),
              const SizedBox(
                height: 20,
              ),
              Table(border: TableBorder.all(), children: const [
                TableRow(
                  children: [
                    TableCellCustom(content: "Chief Complaints", isTitle: true),
                    TableCellCustom(
                        content: 'Clinical Findings', isTitle: true),
                  ],
                ),
                TableRow(
                  children: [
                    TableCellCustom(
                        content:
                            "* FEVER WITH CHILLS (4 DAYS)\n* HEADACHE (2 DAYS)"),
                    TableCellCustom(
                        content:
                            '* THERE ARE TEST FINDING FOR A TEST PATIENT\n* ENTERING SAMPLE DIAGNOSIS AND SAMPLE PRESCRIPTION'),
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
              const Text("* MALARIA"),
              const SizedBox(
                height: 15,
              ),
              Table(
                border: TableBorder.all(),
                children: const [
                  TableRow(
                    children: [
                      TableCellCustom(content: "Medicine Name", isTitle: true),
                      TableCellCustom(content: 'Dosage', isTitle: true),
                      TableCellCustom(content: 'Duration', isTitle: true),
                    ],
                  ),
                  TableRow(
                    children: [
                      TableCellCustom(content: "1) TAB. ABCIXIMAB"),
                      TableCellCustom(content: '1 Morning'),
                      TableCellCustom(content: '8 Days (Tot: 8Tab)'),
                    ],
                  ),
                  TableRow(
                    children: [
                      TableCellCustom(content: "2) TAB. VOMILAST"),
                      TableCellCustom(
                          content: '1 Morning, 1 Night\n("After Food")'),
                      TableCellCustom(content: '8 Days (Tot: 16 Tab)'),
                    ],
                  ),
                  TableRow(
                    children: [
                      TableCellCustom(content: "3) CAP. ZOCLAR 500"),
                      TableCellCustom(content: '1 Morning'),
                      TableCellCustom(content: '3 Days (Tot: 3 Cap)'),
                    ],
                  ),
                  TableRow(
                    children: [
                      TableCellCustom(content: "1) TAB. GESTAKIND 10/SR"),
                      TableCellCustom(content: '1 Night'),
                      TableCellCustom(content: '4 Days (Tot: 4 Tab)'),
                    ],
                  ),
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              const Text(
                "Advice :",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
              ),
              const Text("* TAKE BED REST"),
              const Text("* DO NOT EAT OUTSIDE FOOD"),
              const Text(
                  "* EAT EASY TO DIGEST FOOD LIKE BOILED RICE WITH DAAL"),
              const SizedBox(
                height: 20,
              ),
              const Text(
                "Follow Up : 04-09-2023",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
