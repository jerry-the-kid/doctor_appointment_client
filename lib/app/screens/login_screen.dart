import 'package:doctor_appointment_client/app/widgets/box_input.dart';
import 'package:doctor_appointment_client/app/widgets/full_button.dart';
import 'package:doctor_appointment_client/app/widgets/image_header.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          children: [
            const ImageHeader(
              imageSrc: 'assets/images/background_1.jpg',
            ),
            // const Spacer(),
            SizedBox(height: screenHeight * 0.1),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 25),
              child: Column(
                children: [
                  Text(
                    "Login",
                    style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  BoxInput(label: "Email"),
                  SizedBox(height: 10),
                  BoxInput(
                    label: "Password",
                    obscure: true,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  FullButton(
                    text: "Login",
                  ),
                ],
              ),
            ),
            SizedBox(height: screenHeight * 0.15),
            const Text("Don't have an account? Register"),
          ],
        ),
      )),
    );
  }
}
