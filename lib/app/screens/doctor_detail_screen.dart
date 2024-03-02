import 'package:doctor_appointment_client/app/widgets/divided_button.dart';
import 'package:doctor_appointment_client/app/widgets/doctor_list_tile.dart';
import 'package:doctor_appointment_client/app/widgets/primary_full_btn.dart';
import 'package:doctor_appointment_client/constants/app_colors.dart';
import 'package:doctor_appointment_client/constants/helpers.dart';
import 'package:doctor_appointment_client/data/models/booking_model.dart';
import 'package:doctor_appointment_client/data/models/doctor_model.dart';
import 'package:doctor_appointment_client/providers/booking_provider.dart';
import 'package:doctor_appointment_client/providers/user_provider.dart';
import 'package:doctor_appointment_client/services/auth_service.dart';
import 'package:doctor_appointment_client/services/booking_service.dart';
import 'package:doctor_appointment_client/services/doctor_service.dart';
import 'package:easy_date_timeline/easy_date_timeline.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class DoctorDetailScreen extends StatelessWidget {
  const DoctorDetailScreen({super.key, this.id = '', this.rescheduleBookingID});

  final String id;
  final String? rescheduleBookingID;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        floatingActionButton: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: PrimaryFullBtn(
            title: rescheduleBookingID == null
                ? 'Book Appointment'
                : "Reschedule Appointment",
            onPressed: () {
              if (rescheduleBookingID == null) {
                if (!context
                    .read<UserProvider>()
                    .currentUser!
                    .isFirstBooking!) {
                  context.push('/payments');
                } else {
                  context.push("/preBooking");
                }
              } else {
                Helpers().handleFirebaseException(
                    context: context,
                    callBackFnc: () async {
                      await BookingService().updateBooking(
                          uid: rescheduleBookingID!,
                          data: {
                            "cancel": true,
                            "cancelReason": "Schedule Change"
                          });

                      if (context.mounted) {
                        var bookingProvider = context.read<BookingProvider>();
                        var bookingTime = Helpers()
                            .combineDateTimeAndTimeString(
                                bookingProvider.selectedDate,
                                bookingProvider.selectedHour);

                        var doctor = bookingProvider.doctor!;

                        var booking = BookingModel(
                            selectedDate: bookingTime,
                            userId: Auth().currentUser!.uid,
                            doctorId: doctor.id!,
                            doctorName: doctor.name,
                            title: doctor.title,
                            specialistIn: doctor.specialistIn,
                            avatarUrl: doctor.avatarUrl,
                            createdDate: DateTime.now());

                        await BookingService()
                            .createBooking(bookingModel: booking);
                      }
                    },
                    successCallBack: () {
                      context.replace(
                        Uri(
                          path: '/appNotify',
                          queryParameters: {
                            'svgSrc': 'assets/images/trans_done.svg',
                            'title': 'Booking successfully !!'
                          },
                        ).toString(),
                      );
                    });
              }
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

              Future.delayed(Duration.zero, () {
                context.read<BookingProvider>().setDoctor(doctor: doctor);
              });

              return Padding(
                padding: const EdgeInsets.only(
                    top: 8, bottom: 100.0, left: 20, right: 20),
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
                        isMedicalCheckup: doctor.name == "Medical Checkup",
                      ),
                      if (doctor.name != "Medical Checkup")
                        const SizedBox(
                          height: 20,
                        ),
                      if (doctor.name != "Medical Checkup")
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
                      const TimeLine(),
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

class TimeLine extends StatefulWidget {
  const TimeLine({
    super.key,
  });

  @override
  State<TimeLine> createState() => _TimeLineState();
}

class _TimeLineState extends State<TimeLine> {
  @override
  Widget build(BuildContext context) {
    return EasyDateTimeLine(
        initialDate: context.watch<BookingProvider>().selectedDate,
        disabledDates: Helpers().generateDisabledDates(),
        onDateChange: (value) {
          context
              .read<BookingProvider>()
              .changeSelectedDate(selectedDate: value);
        },
        headerProps: const EasyHeaderProps(
          padding: EdgeInsets.all(0),
          monthPickerType: MonthPickerType.switcher,
          dateFormatter: DateFormatter.dayOnly(),
        ),
        dayProps: const EasyDayProps(
            dayStructure: DayStructure.dayStrDayNum, height: 60));
  }
}

class DividedTab extends StatefulWidget {
  const DividedTab({super.key});

  @override
  State<DividedTab> createState() => _DividedTabState();
}

class _DividedTabState extends State<DividedTab> {
  int tabValue = 0;

  List<Widget> buildTimeSlots(int startHour, int endHour, String endPrefix) {
    List<Widget> timeSlots = [];

    String selectedHour = context.watch<BookingProvider>().selectedHour;

    for (int hour = startHour; hour <= endHour; hour++) {
      // Build time slot widget
      String time = '${hour.toString().padLeft(2, '0')}:00 $endPrefix';
      Widget timeSlot = ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor:
              selectedHour == time ? AppColors.primaryColor : Colors.white,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
            side: const BorderSide(color: Colors.black, width: .4),
          ),
        ),
        onPressed: () {
          context
              .read<BookingProvider>()
              .changeSelectedHour(selectedHour: time);
        },
        child: Text(
          time,
          style: TextStyle(
            color: selectedHour == time ? Colors.white : Colors.black,
          ),
        ),
      );

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
