import 'package:doctor_appointment_client/app/widgets/no_item_note.dart';
import 'package:doctor_appointment_client/constants/app_colors.dart';
import 'package:doctor_appointment_client/constants/helpers.dart';
import 'package:doctor_appointment_client/data/models/report_model.dart';
import 'package:doctor_appointment_client/services/auth_service.dart';
import 'package:doctor_appointment_client/services/report_service.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ReportListScreen extends StatelessWidget {
  final String type;
  const ReportListScreen({super.key, required this.type});

  @override
  Widget build(BuildContext context) {
    String title = "General Health";

    if (type == 'laboratory') title = "Laboratory Test";
    if (type == 'physical') title = 'Physical Health';

    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: FutureBuilder(
            future:
                ReportService().getAllReports(userId: Auth().currentUser!.uid),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }

              if (snapshot.connectionState == ConnectionState.done &&
                  (snapshot.data == null || snapshot.data!.isEmpty)) {
                return Column(
                  children: [
                    const NoItemNote(
                        message: "No general health report found!"),
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.primaryColor,
                            foregroundColor: Colors.white),
                        onPressed: () {
                          context.push('/checkup');
                        },
                        child: const Text("Booking health checkup"))
                  ],
                );
              }
              return Column(
                children: snapshot.data!
                    .map((report) =>
                        ReportItem(report: report, type: type, title: title))
                    .toList(),
              );
            },
          ),
        ),
      ),
    );
  }
}

class ReportItem extends StatelessWidget {
  final ReportModel report;
  final String type;
  final String title;

  const ReportItem(
      {super.key,
      required this.report,
      required this.type,
      required this.title});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        context.push('/health/$type');
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
                    title,
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
                            dateTime: report.createdDate),
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Colors.grey[800]),
                      )
                    ],
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
