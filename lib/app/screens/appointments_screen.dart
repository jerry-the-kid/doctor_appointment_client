// import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:doctor_appointment_client/app/widgets/divided_button.dart';
import 'package:doctor_appointment_client/app/widgets/no_item_note.dart';
import 'package:doctor_appointment_client/app/widgets/upcoming_schedule_card.dart';
import 'package:doctor_appointment_client/data/models/booking_model.dart';
import 'package:doctor_appointment_client/providers/refresh_provider.dart';
import 'package:doctor_appointment_client/services/booking_service.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
            FutureBuilder(
                key: Key(context.watch<KeyRefreshProvider>().bookingKey),
                future: BookingService().getAllBookings(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  }

                  var closestBooking =
                      findClosestBooking(snapshot.data!, DateTime.now());

                  if (snapshot.connectionState == ConnectionState.done &&
                      (snapshot.data == null || snapshot.data!.isEmpty)) {
                    return const NoItemNote(
                        message: "You don't have any schedule !");
                  }

                  var futureBooking = closestBooking == null
                      ? []
                      : findFutureBookingWithoutCancel(
                          snapshot.data!, closestBooking);

                  var pastOrCancelBooking =
                      findCancelledOrPastBookings(snapshot.data!);

                  return tabValue == 0
                      ? Column(
                          children: futureBooking.isEmpty &&
                                  closestBooking == null
                              ? [
                                  const SizedBox(
                                    height: 30,
                                  ),
                                  const NoItemNote(
                                      message: "You don't have any schedule !")
                                ]
                              : [
                                  const SizedBox(height: 20),
                                  UpcomingScheduleCard(
                                    isActive: true,
                                    bookingModel: closestBooking!,
                                  ),
                                  ...futureBooking
                                      .map((booking) => Column(
                                            children: [
                                              const SizedBox(
                                                height: 10,
                                              ),
                                              UpcomingScheduleCard(
                                                  bookingModel: booking),
                                            ],
                                          ))
                                      .toList(),
                                ],
                        )
                      : Column(
                          children: pastOrCancelBooking.isEmpty
                              ? [
                                  const SizedBox(
                                    height: 30,
                                  ),
                                  const NoItemNote(
                                      message: "You don't have any schedule !")
                                ]
                              : [
                                  ...pastOrCancelBooking
                                      .map((booking) => Column(
                                            children: [
                                              const SizedBox(
                                                height: 10,
                                              ),
                                              UpcomingScheduleCard(
                                                  isPast: true,
                                                  isCancel: booking.cancel,
                                                  bookingModel: booking),
                                            ],
                                          ))
                                      .toList()
                                ],
                        );
                }),
          ],
        ),
      ),
    );
  }
}
