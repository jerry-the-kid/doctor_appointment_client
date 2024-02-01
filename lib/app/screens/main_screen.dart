import 'package:doctor_appointment_client/app/screens/appointments_screen.dart';
import 'package:doctor_appointment_client/app/screens/home_screen.dart';
import 'package:doctor_appointment_client/app/screens/notification_screen.dart';
import 'package:doctor_appointment_client/app/screens/pill_reminder_screen.dart';
import 'package:doctor_appointment_client/app/screens/user_screen.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int currentIndex = 0;

  List<String> appBarTitle = [
    '',
    'My Appointment',
    'Pill Reminder  ',
    'Notifications',
    'Settings',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: currentIndex != 0
          ? AppBar(title: Text(appBarTitle[currentIndex]))
          : null,
      bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          iconSize: 35,
          selectedFontSize: 0,
          unselectedFontSize: 0,
          currentIndex: currentIndex,
          onTap: (value) {
            setState(() {
              currentIndex = value;
            });
          },
          items: const [
            BottomNavigationBarItem(
              label: "",
              icon: Icon(Icons.home),
            ),
            BottomNavigationBarItem(
                label: "", icon: Icon(Icons.calendar_month_outlined)),
            BottomNavigationBarItem(
                label: "", icon: Icon(Icons.access_time_rounded)),
            BottomNavigationBarItem(label: "", icon: Icon(Icons.notifications)),
            BottomNavigationBarItem(label: "", icon: Icon(Icons.person)),
          ]),
      body: SafeArea(
        child: IndexedStack(
          index: currentIndex,
          children: const [
            SingleChildScrollView(child: HomeScreen()),
            AppointmentsScreen(),
            SingleChildScrollView(child: PillReminder()),
            NotificationScreen(),
            UserInfoScreen()
          ],
        ),
      ),
    );
  }
}
