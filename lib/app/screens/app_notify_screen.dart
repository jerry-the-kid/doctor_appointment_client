import 'package:doctor_appointment_client/app/screens/payment_methods_screen.dart';
import 'package:doctor_appointment_client/app/widgets/primary_full_btn.dart';
import 'package:doctor_appointment_client/constants/helpers.dart';
import 'package:doctor_appointment_client/providers/booking_provider.dart';
import 'package:doctor_appointment_client/providers/refresh_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class AppNotifyScreen extends StatelessWidget {
  final String svgSrc;
  final String title;
  final String? description;
  final VoidCallback? onBtnClick;

  const AppNotifyScreen({
    super.key,
    required this.svgSrc,
    required this.title,
    this.onBtnClick,
    this.description,
  });

  @override
  Widget build(BuildContext context) {
    var bookingProvider = context.watch<BookingProvider>();
    var bookingTime = Helpers().combineDateTimeAndTimeString(
        bookingProvider.selectedDate, bookingProvider.selectedHour);
    var bookingTimeString =
        "${Helpers().formattedDate(newPattern: "HH:mm", dateTime: bookingTime)} - ${Helpers().formattedDate(newPattern: "HH:mm", dateTime: bookingTime.add(const Duration(hours: 1)))}";

    var height = MediaQuery.of(context).size.height;
    return Scaffold(
        floatingActionButton: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: PrimaryFullBtn(
            title: 'Go to Home Page',
            onPressed: () {
              if (onBtnClick != null) {
                onBtnClick!();
                context.pop();
              } else {
                context.go("/");
                context.read<KeyRefreshProvider>().setRefreshProvider();
              }
            },
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Align(
              alignment: Alignment.center,
              child: Container(
                margin: EdgeInsets.only(
                    top: title == 'Booking successfully !!'
                        ? height * 0.1
                        : height * 0.18),
                constraints: const BoxConstraints(maxWidth: 350),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    title == 'Booking successfully !!'
                        ? Material(
                            borderRadius: BorderRadius.circular(7),
                            elevation: 5,
                            child: Container(
                              padding: const EdgeInsets.fromLTRB(12, 8, 12, 20),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "SaiGon General Hospital: ${bookingProvider.doctor!.specialistIn}",
                                    style: Theme.of(context)
                                        .textTheme
                                        .headlineMedium!
                                        .copyWith(fontSize: 16),
                                  ),
                                  const SizedBox(
                                    height: 18,
                                  ),
                                  Row(
                                    children: [
                                      Expanded(
                                        child: DetailInfo(
                                          label: "Date",
                                          // info: "10.05.2023",
                                          info: Helpers().formattedDate(
                                              newPattern: 'dd.MM.yyyy',
                                              dateTime: context
                                                  .watch<BookingProvider>()
                                                  .selectedDate),
                                        ),
                                      ),
                                      Expanded(
                                        child: DetailInfo(
                                          label: "Time",
                                          // info: "13:00 - 14:00",
                                          info: bookingTimeString,
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 18,
                                  ),
                                  Row(
                                    children: [
                                      Expanded(
                                        child: DetailInfo(
                                          label: "Doctor",
                                          info:
                                              "${bookingProvider.doctor!.title} ${bookingProvider.doctor!.name}",
                                        ),
                                      ),
                                      Expanded(
                                        child: DetailInfo(
                                          label: "Department",
                                          info:
                                              "Phòng ban ${bookingProvider.doctor!.id == 'AUdabJNMbsIRQUZBdMGK' ? "khám sức khỏe" : bookingProvider.doctor!.specialistIn}",
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          )
                        : const Text(''),
                    const SizedBox(
                      height: 20,
                    ),
                    if (title == 'Booking successfully !!')
                      Text(
                        "Booking successfully!!",
                        style: Theme.of(context)
                            .textTheme
                            .headlineMedium!
                            .copyWith(fontWeight: FontWeight.w300),
                      ),
                    SvgPicture.asset(
                      svgSrc,
                      height: 400,
                    ),
                    title == 'Booking successfully !!'
                        ? const Text('')
                        : Text(
                            title,
                            style: Theme.of(context)
                                .textTheme
                                .headlineMedium!
                                .copyWith(fontSize: 28),
                          ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      description ?? "",
                      style: Theme.of(context)
                          .textTheme
                          .headlineMedium!
                          .copyWith(fontWeight: FontWeight.w300),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}
