import 'package:doctor_appointment_client/app/widgets/doctor_list.dart';
import 'package:doctor_appointment_client/constants/app_colors.dart';
import 'package:flutter/material.dart';

class DoctorListScreen extends StatelessWidget {
  const DoctorListScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          foregroundColor: Colors.white,
                          backgroundColor: AppColors.primaryColor,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8))),
                      onPressed: () {},
                      child: const Text("Gynecologist")),
                  const SizedBox(width: 5),
                  ElevatedButton(
                      onPressed: () {}, child: const Text("Pediatrics")),
                  const SizedBox(width: 5),
                  ElevatedButton(
                      onPressed: () {}, child: const Text("Cardiologist")),
                  const SizedBox(width: 5),
                  ElevatedButton(
                      onPressed: () {}, child: const Text("Cardiologist")),
                  const SizedBox(width: 5),
                ],
              ),
            ),
            const SizedBox(height: 30),
            // const Expanded(
            //   child: DoctorList(),
            // )
          ],
        ),
      ),
    );
  }
}
