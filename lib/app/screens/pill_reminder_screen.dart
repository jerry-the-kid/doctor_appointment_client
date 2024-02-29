import 'package:doctor_appointment_client/app/widgets/no_item_note.dart';
import 'package:doctor_appointment_client/constants/app_colors.dart';
import 'package:doctor_appointment_client/constants/helpers.dart';
import 'package:doctor_appointment_client/data/models/pill_model.dart';
import 'package:doctor_appointment_client/services/pill_service.dart';
import 'package:easy_date_timeline/easy_date_timeline.dart';
import 'package:flutter/material.dart';

class PillReminder extends StatefulWidget {
  const PillReminder({super.key});

  @override
  State<PillReminder> createState() => _PillReminderState();
}

class _PillReminderState extends State<PillReminder> {
  DateTime _selectedDate = DateTime.now();

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
                onDateChange: (selectedDate) {
                  setState(() {
                    _selectedDate = selectedDate;
                  });
                },
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
            FutureBuilder(
                future: PillService().getPillsForDay(DateTime.now()),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  }

                  if (snapshot.connectionState == ConnectionState.done &&
                      (snapshot.data == null || snapshot.data!.isEmpty)) {
                    return const NoItemNote(
                        message: "You don't have any pill reminder yet !");
                  }

                  var pills =
                      filterPillsByDateTime(snapshot.data!, _selectedDate);

                  return MedicineStepper(
                    selectedDate: _selectedDate,
                    pills: pills,
                  );
                }),
          ],
        ));
  }
}

class MedicineStepper extends StatefulWidget {
  final List<PillModel> pills;
  final DateTime selectedDate;
  const MedicineStepper(
      {super.key, required this.pills, required this.selectedDate});

  @override
  State<MedicineStepper> createState() => _MedicineStepperState();
}

class _MedicineStepperState extends State<MedicineStepper> {
  int _index = 0;
  late List<PillModel> morningPills;
  late List<PillModel> afternoonPills;
  late List<PillModel> nightPills;
  late bool morningActive;
  late bool afternoonActive;
  late bool nightActive;

  @override
  void initState() {
    morningPills = filterPillsByMedicalHour(widget.pills, 'morning');
    afternoonPills = filterPillsByMedicalHour(widget.pills, 'afternoon');
    nightPills = filterPillsByMedicalHour(widget.pills, 'night');

    morningActive = isCurrentTimeActive(widget.selectedDate, "morning");
    afternoonActive = isCurrentTimeActive(widget.selectedDate, "afternoon");
    nightActive = isCurrentTimeActive(widget.selectedDate, "night");

    if (afternoonActive) _index = 1;
    if (nightActive) _index = 2;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Stepper(
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
            title: const Text('7:00 AM'),
            content: Container(
              alignment: Alignment.centerLeft,
              child: morningPills.isEmpty
                  ? const NoItemNote(
                      message: "You don't have any pills in morning")
                  : Column(
                      children: [
                        ...morningPills.map((p) => Padding(
                              padding: const EdgeInsets.only(bottom: 10),
                              child: Dose(
                                isActive: morningActive,
                                doseName: p.name,
                                doseType: p.type,
                              ),
                            )),
                      ],
                    ),
            ),
          ),
          Step(
            title: const Text('12:00 AM'),
            content: Container(
              alignment: Alignment.centerLeft,
              child: afternoonPills.isEmpty
                  ? const NoItemNote(
                      message: "You don't have any pills in afternoon")
                  : Column(
                      children: [
                        ...afternoonPills.map((p) => Padding(
                              padding: const EdgeInsets.only(bottom: 10),
                              child: Dose(
                                isActive: afternoonActive,
                                doseName: p.name,
                                doseType: p.type,
                              ),
                            )),
                      ],
                    ),
            ),
          ),
          Step(
            title: const Text('19:00 PM'),
            content: Container(
              alignment: Alignment.centerLeft,
              child: nightPills.isEmpty
                  ? const NoItemNote(
                      message: "You don't have any pills in night")
                  : Column(
                      children: [
                        ...nightPills.map((p) => Padding(
                              padding: const EdgeInsets.only(bottom: 10),
                              child: Dose(
                                isActive: nightActive,
                                doseName: p.name,
                                doseType: p.type,
                              ),
                            )),
                      ],
                    ),
            ),
          ),
        ]);
  }
}

class Dose extends StatelessWidget {
  final bool isActive;
  final String doseName;
  final String doseType;

  const Dose({
    super.key,
    this.isActive = false,
    required this.doseName,
    required this.doseType,
  });

  @override
  Widget build(BuildContext context) {
    String description = "";

    if (doseType == 'TAB') {
      description = "1 tablet";
    } else if (doseType == "CAP") {
      description = "1 capsule";
    } else if (doseType == "CAPLET") {
      description = "1 caplet";
    } else if (doseType == "SUSP") {
      description = "1 Suspension";
    } else {
      description = "1 Medicine";
    }

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
                doseName,
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              Text(
                description,
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
