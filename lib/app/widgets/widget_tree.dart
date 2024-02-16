import 'package:doctor_appointment_client/app/screens/login_screen.dart';
import 'package:doctor_appointment_client/app/screens/main_screen.dart';
import 'package:doctor_appointment_client/app/screens/onboard_screen.dart';
import 'package:doctor_appointment_client/services/auth_service.dart';
import 'package:flutter/material.dart';

class WidgetTreeState extends StatefulWidget {
  const WidgetTreeState({super.key});

  @override
  State<WidgetTreeState> createState() => _WidgetTreeStateState();
}

class _WidgetTreeStateState extends State<WidgetTreeState> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: Auth().authStateChanges,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return FutureBuilder(
                future: Auth().getUserDocument(snapshot.data!.uid),
                builder: (context, userSnapshot) {
                  if (userSnapshot.connectionState == ConnectionState.waiting) {
                    return const Scaffold(
                        body: Center(child: CircularProgressIndicator()));
                  }

                  if (userSnapshot.connectionState == ConnectionState.done &&
                      userSnapshot.data!.firstCreate) {
                    return OnBoardScreen(
                        name: userSnapshot.data!.userName,
                        onSubmit: () {
                          setState(() {});
                        });
                  }
                  return const MainScreen();
                });
          }
          return const LoginScreen();
        });
  }
}
