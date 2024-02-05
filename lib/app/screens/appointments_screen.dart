// import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:doctor_appointment_client/app/widgets/divided_button.dart';
import 'package:doctor_appointment_client/app/widgets/upcoming_schedule_card.dart';

import 'package:flutter/material.dart';

class AppointmentsScreen extends StatefulWidget {
  const AppointmentsScreen({super.key});

  @override
  State<AppointmentsScreen> createState() => _AppointmentsScreenState();
}

class _AppointmentsScreenState extends State<AppointmentsScreen> {
  // final List<DateTime?> _singleDatePickerValueWithDefaultValue = [
  //   DateTime.now(),
  // ];
  int tabValue = 0;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        child: Column(
          children: [
            DividedButton(
              firstButtonTitle: "Scheduled",
              secondButtonTitle: "History",
              onChange: (value) {
                setState(() {
                  tabValue = value;
                });
              },
            ),
            // const SizedBox(height: 20),
            // CalendarDatePicker2(
            //     config: CalendarDatePicker2Config(),
            //     value: _singleDatePickerValueWithDefaultValue),
            tabValue == 0
                ? const Column(
                    children: [
                      SizedBox(height: 20),
                      UpcomingScheduleCard(isActive: true),
                      SizedBox(height: 10),
                      UpcomingScheduleCard(),
                      SizedBox(height: 10),
                      UpcomingScheduleCard(),
                    ],
                  )
                : const SizedBox(),
          ],
        ),
      ),
    );
  }
}
