import 'package:doctor_appointment_client/app/widgets/box_input.dart';
import 'package:doctor_appointment_client/app/widgets/full_button.dart';
import 'package:doctor_appointment_client/app/widgets/image_header.dart';
import 'package:doctor_appointment_client/constants/helpers.dart';
import 'package:doctor_appointment_client/services/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:go_router/go_router.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  void handleSubmit(
      {required String email,
      required String password,
      required String confirmPassword,
      required String name}) {
    if (email.isEmpty ||
        password.isEmpty ||
        confirmPassword.isEmpty ||
        name.isEmpty) {
      Helpers().showErrorSnackbar(context, 'Input Fields is required!');
      return;
    }

    if (password != confirmPassword) {
      Helpers().showErrorSnackbar(
          context, 'Password And Confirm Password must be equal!');
      return;
    }

    if (!Helpers().isStringEmail(email)) {
      Helpers().showErrorSnackbar(context, 'Email must be a invalid email!');
      return;
    }

    Helpers().handleFirebaseException(
        context: context,
        callBackFnc: () async {
          await Auth()
              .createUserWithEmailAndPassword(
                  email: email, password: password, name: name)
              .then((value) => EasyLoading.showSuccess('SignUp successfully!')
                  .then((_) => context.go('/')));
        });
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text("Already have an account?"),
          TextButton(
              onPressed: () {
                context.go('/');
              },
              child: const Text("Login")),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          children: [
            const ImageHeader(
              imageSrc: 'assets/images/background_2.jpg',
            ),
            // const Spacer(),
            SizedBox(height: screenHeight * 0.05),
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
                  BoxInput(
                    label: "Your Name",
                    controller: _nameController,
                  ),
                  const SizedBox(height: 10),
                  BoxInput(
                    label: "Email",
                    controller: _emailController,
                  ),
                  const SizedBox(height: 10),
                  BoxInput(
                    label: "Password",
                    obscure: true,
                    controller: _passwordController,
                  ),
                  const SizedBox(height: 10),
                  BoxInput(
                    label: "Confirm Password",
                    obscure: true,
                    controller: _confirmPasswordController,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  FullButton(
                    text: "Submit",
                    onPressed: () {
                      handleSubmit(
                          email: _emailController.text,
                          password: _passwordController.text,
                          confirmPassword: _confirmPasswordController.text,
                          name: _nameController.text);
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      )),
    );
  }
}
