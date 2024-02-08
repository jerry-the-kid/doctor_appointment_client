import 'package:doctor_appointment_client/app/widgets/divided_button.dart';
import 'package:doctor_appointment_client/app/widgets/doctor_list_tile.dart';
import 'package:doctor_appointment_client/app/widgets/full_btn.dart';
import 'package:doctor_appointment_client/app/widgets/full_button.dart';
import 'package:doctor_appointment_client/constants/app_colors.dart';
import 'package:doctor_appointment_client/constants/helpers.dart';
import 'package:easy_date_timeline/easy_date_timeline.dart';
import 'package:flutter/material.dart';

class DoctorDetailScreen extends StatelessWidget {
  const DoctorDetailScreen({super.key, this.id = ''});

  final String id;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const DoctorListTile(
              isListTile: false,
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
              "Dr. Arlene McCoy is the top most Cardiologist specialist in Nayong Hospotalat London. She is avaiable for private consultant",
              style: Theme.of(context)
                  .textTheme
                  .bodySmall!
                  .copyWith(fontSize: 16, fontWeight: FontWeight.w400),
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
                onDateChange: (selectedDate) {},
                headerProps: const EasyHeaderProps(
                  padding: EdgeInsets.all(0),
                  monthPickerType: MonthPickerType.switcher,
                  dateFormatter: DateFormatter.dayOnly(),
                ),
                dayProps: const EasyDayProps(
                    dayStructure: DayStructure.dayStrDayNum, height: 60)),
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
            DividedButton(
              firstButtonTitle: "Morning",
              secondButtonTitle: "Afternoon",
              onChange: (value) {},
            ),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              height: 90,
              child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 4, // Number of columns
                      crossAxisSpacing: 8.0, // Spacing between columns
                      mainAxisSpacing: 8.0, // Spacing between rows
                      childAspectRatio: childAspectRatio(width)),
                  itemCount: 7, // Number of ite  ms in the grid

                  itemBuilder: (BuildContext context, int index) {
                    return ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                              side: const BorderSide(
                                  color: Colors.black, width: .4)),
                        ),
                        onPressed: () {},
                        child: const Text(
                          "8:00 AM",
                          style: TextStyle(color: Colors.black),
                        ));
                  }),
            ),
            const Spacer(
              flex: 2,
            ),
            // const FullButton(title: "Book Appointment"),
            const PrimaryFullBtn(title: 'Book Appointment'),
            const Spacer(),
          ],
        ),
      ),
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

double childAspectRatio(double width) {
  if (width > 1400) return 8;
  if (width > 1000) return 6;
  if (width > 720) return 5;
  if (width > 600) return 4;
  if (width > 470) return 3;
  return 2;
}
