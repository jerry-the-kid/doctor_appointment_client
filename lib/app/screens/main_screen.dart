import 'package:doctor_appointment_client/app/screens/appointments_screen.dart';
import 'package:doctor_appointment_client/app/screens/heath_report_screen.dart';
import 'package:doctor_appointment_client/app/screens/home_screen.dart';
import 'package:doctor_appointment_client/app/screens/pill_reminder_screen.dart';
import 'package:doctor_appointment_client/app/screens/user_setting_screen.dart';
import 'package:doctor_appointment_client/app/widgets/review_dialog.dart';
import 'package:doctor_appointment_client/app/widgets/select_appointment_dialog.dart';
import 'package:doctor_appointment_client/data/models/user_model.dart';
import 'package:doctor_appointment_client/services/auth_service.dart';
import 'package:doctor_appointment_client/services/local_notification_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key, required this.user});

  final UserModel user;

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();
  int currentIndex = 0;

  List<String> appBarTitle = [
    '',
    'My Appointment',
    'Pill Reminder  ',
    'Medical Reports',
    'Settings',
  ];

  @override
  void initState() {
    LocalNotificationService.onClickNotification.stream.listen((event) {});
    requestNotificationPermissions();
    super.initState();
  }

  Future<void> requestNotificationPermissions() async {
    flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>()!
        .requestNotificationsPermission();
    flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>()!
        .requestExactAlarmsPermission();
  }

  @override
  Widget build(BuildContext context) {
    var iconButton = IconButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (_) => const SelectAppointmentDialog(),
          );
        },
        icon: const Icon(Icons.add));

    var logOutButton = IconButton(
        onPressed: () {
          Auth().signOut();
        },
        icon: Icon(
          Icons.logout,
          color: Colors.red[600],
        ));

    return Scaffold(
      appBar: currentIndex != 0
          ? AppBar(
              title: Text(
                appBarTitle[currentIndex],
              ),
              actions: currentIndex == 1
                  ? [iconButton]
                  : currentIndex == 4
                      ? [logOutButton]
                      : null,
            )
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
            BottomNavigationBarItem(label: "", icon: Icon(Icons.checklist)),
            BottomNavigationBarItem(label: "", icon: Icon(Icons.person)),
          ]),
      body: SafeArea(
        child: IndexedStack(
          index: currentIndex,
          children: [
            SingleChildScrollView(
                child: HomeScreen(
              user: widget.user,
              onGoToDoctorList: () {
                setState(() {
                  currentIndex = 1;
                });
              },
            )),
            const SingleChildScrollView(child: AppointmentsScreen()),
            const SingleChildScrollView(child: PillReminder()),
            const SingleChildScrollView(child: HealthReportScreen()),
            const SingleChildScrollView(
              child: UserSettingScreen(),
            )
          ],
        ),
      ),
    );
  }
}
