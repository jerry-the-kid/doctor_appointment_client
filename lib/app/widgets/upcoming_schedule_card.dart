import 'package:doctor_appointment_client/app/widgets/dialog.dart';
import 'package:doctor_appointment_client/constants/app_colors.dart';
import 'package:doctor_appointment_client/constants/helpers.dart';
import 'package:doctor_appointment_client/data/models/booking_model.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class UpcomingScheduleCard extends StatefulWidget {
  final bool isActive;
  final bool isPast;
  final bool isCancel;
  final BookingModel bookingModel;

  const UpcomingScheduleCard({
    super.key,
    required this.bookingModel,
    this.isActive = false,
    this.isPast = false,
    this.isCancel = false,
  });

  @override
  State<UpcomingScheduleCard> createState() => _UpcomingScheduleCardState();
}

class _UpcomingScheduleCardState extends State<UpcomingScheduleCard> {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    var bookingTimeString =
        "${Helpers().formattedDate(newPattern: "HH:mm", dateTime: widget.bookingModel.selectedDate)} - ${Helpers().formattedDate(newPattern: "HH:mm", dateTime: widget.bookingModel.selectedDate.add(const Duration(hours: 1)))}";

    bool isDateTimeWithinThreeDays(DateTime dateTime) {
      DateTime now = DateTime.now();
      Duration difference = dateTime.difference(now);
      return difference.inDays >= 3;
    }

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(18.0),
        color: widget.isActive
            ? AppColors.primaryColor
            : const Color.fromARGB(255, 235, 240, 251),
      ),
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10), // Image border
                child: SizedBox.fromSize(
                  size: const Size.fromRadius(25), // Image radius
                  child: Image.network(widget.bookingModel.avatarUrl,
                      alignment: Alignment.topCenter, fit: BoxFit.cover),
                ),
              ),
              const SizedBox(width: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "${widget.bookingModel.title} ${widget.bookingModel.doctorName}",
                    style: TextStyle(
                        color: widget.isActive ? Colors.white : Colors.black,
                        fontSize: width < 450 ? 16 : 19,
                        fontWeight: FontWeight.w500),
                  ),
                  Text(
                    widget.bookingModel.specialistIn,
                    style: Theme.of(context).textTheme.bodySmall,
                  )
                ],
              ),
              const SizedBox(
                width: 10,
              ),
              if (widget.isCancel)
                Container(
                  decoration: BoxDecoration(
                      color: AppColors.gray_1,
                      borderRadius: BorderRadius.circular(8)),
                  padding:
                      const EdgeInsets.symmetric(vertical: 4, horizontal: 6),
                  child: const Text(
                    "Cancel",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
            ],
          ),
          const SizedBox(height: 15),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
            decoration: BoxDecoration(
                color: widget.isActive
                    ? AppColors.primaryColorDark
                    : Colors.grey[50],
                borderRadius: BorderRadius.circular(7.0)),
            child: Row(
              children: [
                Icon(
                  Icons.calendar_month_outlined,
                  color: AppColors.gray_1,
                  size: width < 450 ? 18 : 22,
                ),
                const SizedBox(
                  width: 5,
                ),
                Text(
                  Helpers().formattedDate(
                      newPattern: 'EEEE, MMMM d',
                      dateTime: widget.bookingModel.selectedDate),
                  style: TextStyle(
                      fontSize: width < 450 ? 12 : 14,
                      color: widget.isActive ? Colors.white : Colors.black),
                ),
                const Spacer(),
                Icon(
                  Icons.access_time_rounded,
                  color: AppColors.gray_1,
                  size: width < 450 ? 18 : 22,
                ),
                const SizedBox(
                  width: 5,
                ),
                Text(
                  // "11:00 - 12:00 AM",
                  bookingTimeString,
                  style: TextStyle(
                      fontSize: width < 450 ? 12 : 14,
                      color: widget.isActive ? Colors.white : Colors.black),
                )
              ],
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          Row(
            children: [
              Expanded(
                  child: ElevatedButton(
                      onPressed: () {
                        if (!widget.isPast) {
                          context.push(
                              '/appointment/cancel/${widget.bookingModel.id}');
                        } else {
                          context
                              .push("/doctors/${widget.bookingModel.doctorId}");
                        }
                      },
                      child: Text(widget.isPast ? 'Re-Book' : 'Cancel'))),
              const SizedBox(width: 10),
              Expanded(
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.orange,
                          foregroundColor: Colors.white),
                      onPressed: widget.isCancel
                          ? null
                          : () {
                              if (!widget.isPast) {
                                if (!isDateTimeWithinThreeDays(
                                    widget.bookingModel.selectedDate)) {
                                  showDialog(
                                      context: context,
                                      builder: (context) => MessageDialog(
                                            'info',
                                            title: "Reschedule Invalid",
                                            message:
                                                "Schedule within 3 days can't be rescheduled",
                                            primaryButtonText: "Cancel",
                                            primaryButtonCallback: () {
                                              Navigator.pop(context, true);
                                            },
                                          ));
                                } else {
                                  showDialog(
                                    context: context,
                                    builder: (context) => MessageDialog(
                                      'info',
                                      title: "Reschedule Warning",
                                      message:
                                          "Current schedule will be canceled to make new one.",
                                      primaryButtonText: "Reschedule",
                                      primaryButtonCallback: () {
                                        Navigator.pop(context, true);
                                        context.push(
                                          Uri(
                                            path:
                                                '/doctors/${widget.bookingModel.doctorId}',
                                            queryParameters: {
                                              'rescheduleBookingID':
                                                  widget.bookingModel.id,
                                            },
                                          ).toString(),
                                        );
                                      },
                                      secondaryButtonText: "Cancel",
                                      secondaryButtonCallback: () {
                                        Navigator.pop(context, true);
                                      },
                                    ),
                                  );
                                }
                              }
                            },
                      child: Text(widget.isPast ? 'Add Review' : "Reschedule")))
            ],
          ),
        ],
      ),
    );
  }
}
