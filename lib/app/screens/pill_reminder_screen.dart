import 'package:doctor_appointment_client/constants/app_colors.dart';
import 'package:doctor_appointment_client/constants/helpers.dart';
import 'package:easy_date_timeline/easy_date_timeline.dart';
import 'package:flutter/material.dart';

class PillReminder extends StatefulWidget {
  const PillReminder({super.key});

  @override
  State<PillReminder> createState() => _PillReminderState();
}

class _PillReminderState extends State<PillReminder> {
  int _index = 0;

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
            Stepper(
                currentStep: _index,
                onStepCancel: () {
                  if (_index > 0) {
                    setState(() {
                      _index -= 1;
                    });
                  }
                },
                onStepContinue: () {
                  if (_index <= 0) {
                    setState(() {
                      _index += 1;
                    });
                  }
                },
                onStepTapped: (int index) {
                  setState(() {
                    _index = index;
                  });
                },
                steps: [
                  Step(
                    title: const Text('8:00 AM'),
                    content: Container(
                      alignment: Alignment.centerLeft,
                      child: const Column(
                        children: [
                          Dose(isActive: true),
                          SizedBox(height: 10),
                          Dose(isActive: true),
                        ],
                      ),
                    ),
                  ),
                  Step(
                    title: const Text('10:00 AM'),
                    content: Container(
                      alignment: Alignment.centerLeft,
                      child: const Column(
                        children: [
                          Dose(),
                          SizedBox(height: 10),
                          Dose(),
                        ],
                      ),
                    ),
                  ),
                  Step(
                    title: const Text('10:00 AM'),
                    content: Container(
                      alignment: Alignment.centerLeft,
                      child: const Column(
                        children: [
                          Dose(),
                          SizedBox(height: 10),
                          Dose(),
                        ],
                      ),
                    ),
                  ),
                  Step(
                    title: const Text('10:00 AM'),
                    content: Container(
                      alignment: Alignment.centerLeft,
                      child: const Column(
                        children: [
                          Dose(),
                          SizedBox(height: 10),
                          Dose(),
                        ],
                      ),
                    ),
                  ),
                ])
          ],
        ));
  }
}

class Dose extends StatelessWidget {
  final bool isActive;

  const Dose({
    super.key,
    this.isActive = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 20),
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      decoration: BoxDecoration(
          color: isActive ? AppColors.color_yellow_bg : AppColors.gray_3,
          borderRadius: BorderRadius.circular(8)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Zincovit CL",
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              Text(
                "2 spoons after meals",
                style: Theme.of(context).textTheme.bodySmall,
              )
            ],
          ),
          isActive
              ? const Icon(
                  Icons.warning_rounded,
                  color: AppColors.orange,
                )
              : const SizedBox.shrink()
        ],
      ),
    );
  }
}

// TimelineTile(
//             alignment: TimelineAlign.manual,
//             lineXY: 0.25,
//             startChild: const Text("8:00 AM"),
//             endChild: Column(
//               children: [
                // Container(
                //   margin: const EdgeInsets.only(left: 20),
                //   padding: const EdgeInsets.symmetric(
                //       vertical: 10, horizontal: 10),
                //   decoration: BoxDecoration(
                //       color: AppColors.gray_3,
                //       borderRadius: BorderRadius.circular(8)),
                //   child: const Row(
                //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //     children: [
                //       Column(
                //         crossAxisAlignment: CrossAxisAlignment.start,
                //         children: [
                //           Text("Zincovit CL"),
                //           Text("2 spoons after meals")
                //         ],
                //       ),
                //       Icon(Icons.done)
                //     ],
                //   ),
                // ),
//                 const SizedBox(height: 10),
//                 Container(
//                   margin: const EdgeInsets.only(left: 20),
//                   padding: const EdgeInsets.symmetric(
//                       vertical: 10, horizontal: 10),
//                   decoration: BoxDecoration(
//                       color: AppColors.gray_3,
//                       borderRadius: BorderRadius.circular(8)),
//                   child: const Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Text("Zincovit CL"),
//                           Text("2 spoons after meals")
//                         ],
//                       ),
//                       Icon(Icons.done)
//                     ],
//                   ),
//                 ),
//                 const SizedBox(height: 10),
//                 Container(
//                   margin: const EdgeInsets.only(left: 20),
//                   padding: const EdgeInsets.symmetric(
//                       vertical: 10, horizontal: 10),
//                   decoration: BoxDecoration(
//                       color: AppColors.gray_3,
//                       borderRadius: BorderRadius.circular(8)),
//                   child: const Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Text("Zincovit CL"),
//                           Text("2 spoons after meals")
//                         ],
//                       ),
//                       Icon(Icons.done)
//                     ],
//                   ),
//                 )
//               ],
//             ),
//             indicatorStyle: const IndicatorStyle(
//               width: 10,
//               height: 10,
//             ),
//             isFirst: true,
//           ),
//           TimelineTile(
//             alignment: TimelineAlign.manual,
//             lineXY: 0.25,
//             startChild: const Text("8:00 AM"),
//             endChild: Column(
//               children: [
//                 Container(
//                   margin: const EdgeInsets.only(left: 20),
//                   padding: const EdgeInsets.symmetric(
//                       vertical: 10, horizontal: 10),
//                   decoration: BoxDecoration(
//                       color: AppColors.gray_3,
//                       borderRadius: BorderRadius.circular(8)),
//                   child: const Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Text("Zincovit CL"),
//                           Text("2 spoons after meals")
//                         ],
//                       ),
//                       Icon(Icons.done)
//                     ],
//                   ),
//                 ),
//                 const SizedBox(height: 10),
//                 Container(
//                   margin: const EdgeInsets.only(left: 20),
//                   padding: const EdgeInsets.symmetric(
//                       vertical: 10, horizontal: 10),
//                   decoration: BoxDecoration(
//                       color: AppColors.gray_3,
//                       borderRadius: BorderRadius.circular(8)),
//                   child: const Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Text("Zincovit CL"),
//                           Text("2 spoons after meals")
//                         ],
//                       ),
//                       Icon(Icons.done)
//                     ],
//                   ),
//                 ),
//                 const SizedBox(height: 10),
//                 Container(
//                   margin: const EdgeInsets.only(left: 20),
//                   padding: const EdgeInsets.symmetric(
//                       vertical: 10, horizontal: 10),
//                   decoration: BoxDecoration(
//                       color: AppColors.gray_3,
//                       borderRadius: BorderRadius.circular(8)),
//                   child: const Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Text("Zincovit CL"),
//                           Text("2 spoons after meals")
//                         ],
//                       ),
//                       Icon(Icons.done)
//                     ],
//                   ),
//                 )
//               ],
//             ),
//             indicatorStyle: const IndicatorStyle(
//               width: 10,
//               height: 10,
//             ),
//           ),
