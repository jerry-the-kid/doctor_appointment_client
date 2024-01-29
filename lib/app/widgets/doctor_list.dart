import 'package:doctor_appointment_client/app/widgets/doctor_list_tile.dart';
import 'package:flutter/material.dart';

class DoctorList extends StatelessWidget {
  const DoctorList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView(
      scrollDirection: Axis.vertical,
      children: const [
        DoctorListTile(),
        SizedBox(height: 10),
        DoctorListTile(),
        SizedBox(height: 10),
        DoctorListTile(),
        SizedBox(height: 10),
      ],
    );
  }
}
