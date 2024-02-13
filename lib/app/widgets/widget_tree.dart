import 'package:doctor_appointment_client/app/screens/home_screen.dart';
import 'package:doctor_appointment_client/app/screens/login_screen.dart';
import 'package:doctor_appointment_client/app/screens/main_screen.dart';
import 'package:doctor_appointment_client/services/auth.dart';
import 'package:flutter/material.dart';

class WidgetTreeState extends StatelessWidget {
  const WidgetTreeState({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: Auth().authStateChanges,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return const MainScreen();
          }
          return const LoginScreen();
        });
  }
}
