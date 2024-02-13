import 'package:doctor_appointment_client/app/widgets/box_input.dart';
import 'package:doctor_appointment_client/app/widgets/full_button.dart';
import 'package:doctor_appointment_client/app/widgets/image_header.dart';
import 'package:doctor_appointment_client/services/auth.dart';
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
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Column(
                children: [
                  const Text(
                    "Login",
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
                  const SizedBox(
                    height: 20,
                  ),
                  FullButton(
                    text: "Login",
                    onPressed: () async {
                      try {
                        await Auth().signInWithEmailAndPassword(
                            email: 'hao@gmail.com', password: '123456');
                      } catch (e) {
                        print(e);
                      }
                    },
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
