import 'package:doctor_appointment_client/app/widgets/primary_full_btn.dart';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class Item {
  Item({
    required this.expandedValue,
    required this.headerValue,
    this.isExpanded = false,
  });

  String expandedValue;
  String headerValue;
  bool isExpanded;
}

class CheckupAppointmentScreen extends StatefulWidget {
  const CheckupAppointmentScreen({super.key});

  @override
  State<CheckupAppointmentScreen> createState() =>
      _CheckupAppointmentScreenState();
}

class _CheckupAppointmentScreenState extends State<CheckupAppointmentScreen> {
  final List<Item> _data = [
    Item(
        expandedValue:
            "Comprehensive medical examination and specialized examination (according to Circular No. 14/2013/TT-BYT dated May 6, 2013 of the Ministry of Health):"
            "\n\n• Urine test:"
            "\n\n   a) Comprehensive urine analysis"
            "\n\n• Blood test:"
            "\n\n   a) Complete blood count\n\n   b) HbsAg and Anti-HBs\n\n   c) Anti-HCV\n\n   d) Syphilis test: VDRL or RPR and TpHA"
            "\n\n• Chest X-ray\n",
        headerValue: "Overview",
        isExpanded: true),
    Item(
        expandedValue:
            "Your Health Check-ups is scheduled with prior appointments only."
            "\n\nMinimum 10 to 12 hours of fasting is essential prior to check-up. You may drink water."
            "\n\nGet sufficient rest one day prior to health check-up."
            "\n\nAvoid Alcohol 3 days prior to health check up\n",
        headerValue: "Pre - Test Requirements"),
    Item(expandedValue: "N/A", headerValue: "Refund and Cancellation"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Health Checkup"),
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: PrimaryFullBtn(
          title: "Schedule Now",
          onPressed: () {
            context.push('/doctors/AUdabJNMbsIRQUZBdMGK');
          },
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: SingleChildScrollView(
        child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                ExpansionPanelList(
                  expansionCallback: (int index, bool isExpanded) {
                    setState(() {
                      _data[index].isExpanded = isExpanded;
                    });
                  },
                  children: _data.map<ExpansionPanel>((Item item) {
                    return ExpansionPanel(
                      headerBuilder: (BuildContext context, bool isExpanded) {
                        return ListTile(
                          title: Text(
                            item.headerValue,
                            style: const TextStyle(fontWeight: FontWeight.w500),
                          ),
                        );
                      },
                      body: Column(children: [
                        Divider(
                          color: Colors.grey[400],
                        ),
                        ListTile(
                          // title: Text(item.expandedValue),
                          subtitle: Text(item.expandedValue),
                        ),
                      ]),
                      isExpanded: item.isExpanded,
                    );
                  }).toList(),
                )
              ],
            )),
      ),
    );
  }
}
