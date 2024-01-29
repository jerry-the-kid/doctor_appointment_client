import 'package:doctor_appointment_client/constants/app_colors.dart';
import 'package:doctor_appointment_client/constants/helpers.dart';
import 'package:easy_date_timeline/easy_date_timeline.dart';
import 'package:flutter/material.dart';
import 'package:timeline_tile/timeline_tile.dart';

class PillReminder extends StatelessWidget {
  const PillReminder({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
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
              "Your dosage",
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            const SizedBox(
              height: 20,
            ),
            TimelineTile(
              alignment: TimelineAlign.manual,
              lineXY: 0.25,
              startChild: const Text("8:00 AM"),
              endChild: Column(
                children: [
                  Container(
                    margin: const EdgeInsets.only(left: 20),
                    padding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 10),
                    decoration: BoxDecoration(
                        color: AppColors.gray_3,
                        borderRadius: BorderRadius.circular(8)),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Zincovit CL"),
                            Text("2 spoons after meals")
                          ],
                        ),
                        Icon(Icons.done)
                      ],
                    ),
                  ),
                  const SizedBox(height: 10),
                  Container(
                    margin: const EdgeInsets.only(left: 20),
                    padding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 10),
                    decoration: BoxDecoration(
                        color: AppColors.gray_3,
                        borderRadius: BorderRadius.circular(8)),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Zincovit CL"),
                            Text("2 spoons after meals")
                          ],
                        ),
                        Icon(Icons.done)
                      ],
                    ),
                  ),
                  const SizedBox(height: 10),
                  Container(
                    margin: const EdgeInsets.only(left: 20),
                    padding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 10),
                    decoration: BoxDecoration(
                        color: AppColors.gray_3,
                        borderRadius: BorderRadius.circular(8)),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Zincovit CL"),
                            Text("2 spoons after meals")
                          ],
                        ),
                        Icon(Icons.done)
                      ],
                    ),
                  )
                ],
              ),
              indicatorStyle: const IndicatorStyle(
                width: 10,
                height: 10,
              ),
              isFirst: true,
            ),
            TimelineTile(
              alignment: TimelineAlign.manual,
              lineXY: 0.25,
              startChild: const Text("8:00 AM"),
              endChild: Column(
                children: [
                  Container(
                    margin: const EdgeInsets.only(left: 20),
                    padding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 10),
                    decoration: BoxDecoration(
                        color: AppColors.gray_3,
                        borderRadius: BorderRadius.circular(8)),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Zincovit CL"),
                            Text("2 spoons after meals")
                          ],
                        ),
                        Icon(Icons.done)
                      ],
                    ),
                  ),
                  const SizedBox(height: 10),
                  Container(
                    margin: const EdgeInsets.only(left: 20),
                    padding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 10),
                    decoration: BoxDecoration(
                        color: AppColors.gray_3,
                        borderRadius: BorderRadius.circular(8)),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Zincovit CL"),
                            Text("2 spoons after meals")
                          ],
                        ),
                        Icon(Icons.done)
                      ],
                    ),
                  ),
                  const SizedBox(height: 10),
                  Container(
                    margin: const EdgeInsets.only(left: 20),
                    padding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 10),
                    decoration: BoxDecoration(
                        color: AppColors.gray_3,
                        borderRadius: BorderRadius.circular(8)),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Zincovit CL"),
                            Text("2 spoons after meals")
                          ],
                        ),
                        Icon(Icons.done)
                      ],
                    ),
                  )
                ],
              ),
              indicatorStyle: const IndicatorStyle(
                width: 10,
                height: 10,
              ),
            ),
          ],
        ));
  }
}
