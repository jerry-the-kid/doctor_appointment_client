import 'package:doctor_appointment_client/app/widgets/box_input.dart';
import 'package:doctor_appointment_client/app/widgets/full_button.dart';
import 'package:doctor_appointment_client/app/widgets/image_header.dart';
import 'package:doctor_appointment_client/constants/helpers.dart';
import 'package:doctor_appointment_client/services/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _userNameController = TextEditingController();
  final _passwordController = TextEditingController();

  void handleSubmit(String email, String password) async {
    if (email.isEmpty || password.isEmpty) {
      Helpers().showErrorSnackbar(context, 'Password and email is required!');
      return;
    }

    if (!Helpers().isStringEmail(email)) {
      Helpers().showErrorSnackbar(context, 'Email must be a invalid email!');
      return;
    }

    Helpers().handleFirebaseException(
        context: context,
        callBackFnc: () => Auth()
            .signInWithEmailAndPassword(email: email, password: password));
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text("Don't have an account?"),
          TextButton(
              onPressed: () {
                context.go('/register');
              },
              child: const Text("Register")),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
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
                  BoxInput(label: "Email", controller: _userNameController),
                  const SizedBox(height: 10),
                  BoxInput(
                    label: "Password",
                    obscure: true,
                    controller: _passwordController,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  FullButton(
                    text: "Login",
                    onPressed: () {
                      handleSubmit(
                          _userNameController.text, _passwordController.text);
                    },
                  ),
                ],
              ),
            ),
            // SizedBox(height: screenHeight * 0.15),
          ],
        ),
      )),
    );
  }
}
