import 'package:doctor_appointment_client/constants/app_colors.dart';
import 'package:doctor_appointment_client/constants/helpers.dart';
import 'package:doctor_appointment_client/providers/refresh_provider.dart';
import 'package:doctor_appointment_client/services/booking_service.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class CancelAppointment extends StatefulWidget {
  final String bookingId;

  const CancelAppointment({super.key, required this.bookingId});

  @override
  State<CancelAppointment> createState() => _CancelAppointmentState();
}

List<String> options = [
  'Schedule Change',
  'Weather Conditions',
  'Unexpected Work',
  'Childcare Issue',
  'Travel Delays',
  'Other'
];

class _CancelAppointmentState extends State<CancelAppointment> {
  String currentOption = options[0];
  String otherReason = "";

  void _handleOtherReasonChange(String value) {
    setState(() {
      otherReason = value;
    });
  }

  void _handleRadioValueChange(String? value) {
    if (value != null) {
      setState(() {
        currentOption = value;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Cancel Booking")),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Please select the reason for cancellations:',
                style: Theme.of(context)
                    .textTheme
                    .bodySmall!
                    .copyWith(fontSize: 16, fontWeight: FontWeight.w400),
              ),
              const SizedBox(
                height: 15,
              ),
              ...options.map(
                (data) => ListTile(
                  contentPadding: const EdgeInsets.all(0),
                  title: Text(data),
                  leading: Radio(
                      value: data,
                      groupValue: currentOption,
                      onChanged: _handleRadioValueChange),
                ),
              ),
              const SizedBox(height: 20),
              Divider(color: Colors.grey[300]),
              const SizedBox(height: 10),
              Text(
                'Other',
                style: Theme.of(context)
                    .textTheme
                    .bodySmall!
                    .copyWith(fontSize: 16, fontWeight: FontWeight.w400),
              ),
              const SizedBox(height: 10),
              RoundedTextArea(
                onChanged: _handleOtherReasonChange,
              ),
              const SizedBox(height: 50),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 20),
                        backgroundColor: AppColors.primaryColor,
                        foregroundColor: Colors.white),
                    onPressed: () {
                      Helpers().handleFirebaseException(
                          context: context,
                          callBackFnc: () async {
                            await BookingService()
                                .updateBooking(uid: widget.bookingId, data: {
                              "cancel": true,
                              "cancelReason": currentOption == 'Other'
                                  ? otherReason
                                  : currentOption
                            });
                          },
                          successCallBack: () {
                            context
                                .read<KeyRefreshProvider>()
                                .setRefreshProvider();
                            context.pop();
                          });
                    },
                    child: const Text("Cancel Appointment")),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class RoundedTextArea extends StatelessWidget {
  final Function(String)? onChanged;
  final String? placeholder;

  const RoundedTextArea(
      {super.key, this.onChanged, this.placeholder = "Enter your reason"});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        border: Border.all(
          color: Colors.grey, // You can specify your desired border color here
          width: 1.0,
        ),
      ),
      child: TextFormField(
        onChanged: onChanged,
        minLines: 6,
        keyboardType: TextInputType.multiline,
        maxLines: null,
        decoration: InputDecoration(
          hintText: placeholder, // Placeholder text
          contentPadding:
              const EdgeInsets.all(10.0), // Padding within the TextFormField
          border: InputBorder.none, // Remove default border
        ),
      ),
    );
  }
}
