import 'package:doctor_appointment_client/app/widgets/doctor_list_tile.dart';
import 'package:doctor_appointment_client/data/models/doctor_model.dart';
import 'package:flutter/material.dart';

class DoctorList extends StatelessWidget {
  final List<DoctorModel> doctors;

  const DoctorList({
    super.key,
    required this.doctors,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.vertical,
      itemCount: doctors.length,
      itemBuilder: (context, index) {
        DoctorModel doctor = doctors[index];

        return Column(children: [
          const SizedBox(
            height: 10,
          ),
          DoctorListTile(
            id: doctor.id!,
            name: doctor.name,
            title: doctor.title,
            specialistIn: doctor.specialistIn,
            avatarUrl: doctor.avatarUrl,
          ),
        ]);
      },
    );
  }
}
