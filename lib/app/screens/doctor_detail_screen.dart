import 'package:doctor_appointment_client/app/widgets/divided_button.dart';
import 'package:doctor_appointment_client/app/widgets/doctor_list_tile.dart';
import 'package:doctor_appointment_client/app/widgets/primary_full_btn.dart';
import 'package:doctor_appointment_client/constants/app_colors.dart';
import 'package:doctor_appointment_client/constants/helpers.dart';
import 'package:doctor_appointment_client/data/models/doctor_model.dart';
import 'package:doctor_appointment_client/services/doctor_service.dart';
import 'package:easy_date_timeline/easy_date_timeline.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class DoctorDetailScreen extends StatelessWidget {
  const DoctorDetailScreen({super.key, this.id = ''});

  final String id;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        floatingActionButton: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: PrimaryFullBtn(
            title: 'Book Appointment',
            onPressed: () {
              context.push('/payments');
            },
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        body: FutureBuilder(
          future: DoctorService().getDoctor(uid: id),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (snapshot.hasError) {
              return Center(
                child: Text('Error: ${snapshot.error}'),
              );
            } else if (!snapshot.hasData || snapshot.data == null) {
              return const Center(
                child: Text('Doctor not found!'),
              );
            } else {
              DoctorModel doctor = snapshot.data!;

              return Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 8.0, horizontal: 20),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      DoctorListTile(
                        isListTile: false,
                        id: id,
                        name: doctor.name,
                        title: doctor.title,
                        avatarUrl: doctor.avatarUrl,
                        specialistIn: doctor.specialistIn,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Text(
                        "About Doctor",
                        style: Theme.of(context).textTheme.headlineMedium,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        doctor.description,
                        style: Theme.of(context).textTheme.bodySmall!.copyWith(
                            fontSize: 16, fontWeight: FontWeight.w400),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Schedules",
                            style: Theme.of(context).textTheme.headlineMedium,
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      EasyDateTimeLine(
                          initialDate: DateTime.now(),
                          disabledDates: Helpers().generateDisabledDates(),
                          onDateChange: (selectedDate) {
                            print(selectedDate);
                          },
                          headerProps: const EasyHeaderProps(
                            padding: EdgeInsets.all(0),
                            monthPickerType: MonthPickerType.switcher,
                            dateFormatter: DateFormatter.dayOnly(),
                          ),
                          dayProps: const EasyDayProps(
                              dayStructure: DayStructure.dayStrDayNum,
                              height: 60)),
                      const SizedBox(
                        height: 20,
                      ),
                      Text(
                        "Visit Hour",
                        style: Theme.of(context).textTheme.headlineMedium,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const DividedTab()
                    ],
                  ),
                ),
              );
            }
          },
        ));
  }
}

class DividedTab extends StatefulWidget {
  const DividedTab({super.key});

  @override
  State<DividedTab> createState() => _DividedTabState();
}

class _DividedTabState extends State<DividedTab> {
  int tabValue = 0;
  String seletedHour = "";

  List<Widget> buildTimeSlots(int startHour, int endHour, String endPrefix) {
    List<Widget> timeSlots = [];

    for (int hour = startHour; hour <= endHour; hour++) {
      // Build time slot widget
      String time = '${hour.toString().padLeft(2, '0')}:00 $endPrefix';
      Widget timeSlot = ElevatedButton(
        style: ElevatedButton.styleFrom(
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
            side: const BorderSide(color: Colors.black, width: .4),
          ),
        ),
        onPressed: () {
          // Handle button press
        },
        child: Text(
          time,
          style: const TextStyle(
            color: Colors.black,
          ),
        ),
      );

      // Add the time slot widget to the list
      timeSlots.add(timeSlot);
    }

    return timeSlots;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DividedButton(
          firstButtonTitle: "Morning",
          secondButtonTitle: "Afternoon",
          onChange: (value) {
            setState(() {
              tabValue = value;
            });
          },
        ),
        const SizedBox(
          height: 20,
        ),
        Wrap(
          spacing: 10,
          runSpacing: 5,
          children: [
            ...tabValue == 0
                ? buildTimeSlots(7, 11, "AM")
                : buildTimeSlots(2, 5, "PM")
          ],
        ),
      ],
    );
  }
}

class DateItem extends StatelessWidget {
  final String weekday;
  final String day;
  final bool isActive;

  const DateItem({
    super.key,
    required this.weekday,
    required this.day,
    this.isActive = false,
  });

  @override
  Widget build(BuildContext context) {
    final textStyle = TextStyle(
        fontWeight: FontWeight.bold,
        color: isActive ? Colors.white : Colors.black);

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 9),
      decoration: BoxDecoration(
          color: isActive ? AppColors.primaryColor : AppColors.gray_3,
          borderRadius: BorderRadius.circular(10)),
      child: Column(
        children: [
          Text(
            weekday,
            style: textStyle,
          ),
          Text(
            day,
            style: textStyle,
          )
        ],
      ),
    );
  }
}
