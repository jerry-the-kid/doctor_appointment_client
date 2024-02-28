import 'package:doctor_appointment_client/app/widgets/doctor_list.dart';
import 'package:doctor_appointment_client/app/widgets/no_item_note.dart';
import 'package:doctor_appointment_client/constants/app_colors.dart';
import 'package:doctor_appointment_client/services/doctor_service.dart';
import 'package:flutter/material.dart';

List<String> doctorSpecialist = [
  "Khoa Răng Hàm Mặt",
  "Khoa Ngoại Tổng Hợp",
  "Khoa Nội Tổng Hợp",
];

class DoctorListScreen extends StatefulWidget {
  const DoctorListScreen({super.key});

  @override
  State<DoctorListScreen> createState() => _DoctorListScreenState();
}

class _DoctorListScreenState extends State<DoctorListScreen> {
  String selectedSpecialist = doctorSpecialist[0];

  @override
  Widget build(BuildContext context) {
    ButtonStyle activeButtonStyle = ElevatedButton.styleFrom(
      foregroundColor: Colors.white,
      backgroundColor: AppColors.primaryColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text("Doctors"),
        actions: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: IconButton(onPressed: () {}, icon: const Icon(Icons.sort)),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 20),
        child: Column(
          children: [
            SizedBox(
              height: 40,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  ...doctorSpecialist.map((e) => Row(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          ElevatedButton(
                              style: selectedSpecialist == e
                                  ? activeButtonStyle
                                  : null,
                              onPressed: () {
                                setState(() {
                                  selectedSpecialist = e;
                                });
                              },
                              child: Text(e)),
                          const SizedBox(width: 5),
                        ],
                      )),
                ],
              ),
            ),
            const SizedBox(height: 30),
            FutureBuilder(
                future: DoctorService()
                    .getDoctorsBySpecialist(specialistIn: selectedSpecialist),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Expanded(
                        child: Center(
                      child: CircularProgressIndicator(),
                    ));
                  }

                  if (snapshot.connectionState == ConnectionState.done &&
                      (snapshot.data == null || snapshot.data!.isEmpty)) {
                    return const NoItemNote(
                        message: "No doctors found with this specialist !");
                  }

                  return Expanded(child: DoctorList(doctors: snapshot.data!));
                })
          ],
        ),
      ),
    );
  }
}
