import 'package:doctor_appointment_client/app/screens/cancel_appointment.dart';
import 'package:doctor_appointment_client/app/widgets/primary_full_btn.dart';
import 'package:doctor_appointment_client/constants/app_colors.dart';
import 'package:doctor_appointment_client/constants/helpers.dart';
import 'package:doctor_appointment_client/providers/user_provider.dart';
import 'package:doctor_appointment_client/services/auth_service.dart';
import 'package:doctor_appointment_client/services/user_service.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

List<String> allergies = [
  "No allergies",
  "Pollen",
  "Animal fur",
  "Food",
  "House dust",
  "Season",
];

List<String> chronic = [
  "No chronic diseases",
  "Diabetes",
  "Asthma",
  "Chronic kidney disease",
  "Rheumatoid arthritis",
  "Chronic heart failure",
];

List<String> surgeries = [
  "There were no operations",
  "Surgical intervention on internal organs",
  "Orthopedic operations",
  "Neurosurgery",
  "Chronic heart failure",
  "Gynecological operations",
  "Operations on respiratory organs",
];

class PreBookingScreen extends StatefulWidget {
  const PreBookingScreen({super.key});

  @override
  State<PreBookingScreen> createState() => _PreBookingScreenState();
}

class _PreBookingScreenState extends State<PreBookingScreen> {
  bool isOther = false;
  int index = 1;

  @override
  Widget build(BuildContext context) {
    String title = "Do you have allergies?";
    List<String> data = allergies;

    if (index == 2) {
      title = "Are there chronic diseases ?";
      data = chronic;
    }

    if (index == 3) {
      title = "Have you have any surgeries?";
      data = surgeries;
    }

    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: PrimaryFullBtn(
          title: index == 3 ? "Back to booking" : 'Continue',
          onPressed: () {
            if (index < 3) {
              setState(() {
                index++;
              });
            } else {
              UserService().updateUser(
                  uid: Auth().currentUser!.uid,
                  data: {"isFirstBooking": false});

              context.read<UserProvider>().updateIsFirstBooking(false);
              context.replace('/payments');
            }
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding:
              const EdgeInsets.only(top: 20, left: 20, right: 20, bottom: 70),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    index.toString(),
                    style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        color: AppColors.orange,
                        fontSize: 18),
                  ),
                  const Text(
                    "/3",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  )
                ],
              ),
              const SizedBox(
                height: 40,
              ),
              Align(
                alignment: Alignment.center,
                child: Text(
                  title,
                  style: Theme.of(context)
                      .textTheme
                      .headlineMedium!
                      .copyWith(fontSize: 24),
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              Column(
                children: [
                  ...data.map((allergy) => SelectCard(
                        key: Key(Helpers().generateRandomKey()),
                        title: allergy,
                      )),
                  SelectCard(
                    title: "Other",
                    otherCallback: () {
                      setState(() {
                        isOther = !isOther;
                      });
                    },
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  if (isOther)
                    RoundedTextArea(
                      placeholder: "Describe your disease.",
                      onChanged: (value) {},
                    ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

class SelectCard extends StatefulWidget {
  final String title;
  final VoidCallback? otherCallback;
  const SelectCard({super.key, required this.title, this.otherCallback});

  @override
  State<SelectCard> createState() => _SelectCardState();
}

class _SelectCardState extends State<SelectCard> {
  bool done = false;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: GestureDetector(
        onTap: () {
          if (widget.otherCallback != null) {
            widget.otherCallback!();
          }
          setState(() {
            done = !done;
          });
        },
        child: Card(
          shape: RoundedRectangleBorder(
            side: done
                ? const BorderSide(color: AppColors.primaryColor)
                : BorderSide.none,
            borderRadius: BorderRadius.circular(8.0),
          ),
          elevation: 1.5,
          child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    widget.title,
                    style: const TextStyle(
                        fontWeight: FontWeight.w500, fontSize: 16),
                  ),
                  if (done) const Icon(Icons.done),
                ],
              )),
        ),
      ),
    );
  }
}
