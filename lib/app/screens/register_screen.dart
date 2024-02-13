import 'package:doctor_appointment_client/app/widgets/box_input.dart';
import 'package:doctor_appointment_client/app/widgets/full_button.dart';
import 'package:doctor_appointment_client/app/widgets/image_header.dart';
import 'package:flutter/material.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          children: [
            const ImageHeader(
              imageSrc: 'assets/images/background_2.jpg',
            ),
            // const Spacer(),
            SizedBox(height: screenHeight * 0.1),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Column(
                children: [
                  const Text(
                    "Register",
                    style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const BoxInput(label: "Email"),
                  const SizedBox(height: 10),
                  const BoxInput(
                    label: "Password",
                    obscure: true,
                  ),
                  const SizedBox(height: 10),
                  const BoxInput(
                    label: "Confirm Password",
                    obscure: true,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  FullButton(
                    text: "Submit",
                    onPressed: () {},
                  ),
                ],
              ),
            ),
            SizedBox(height: screenHeight * 0.1),
            const Text("Already have an account? Login"),
          ],
        ),
      )),
    );
  }
}
