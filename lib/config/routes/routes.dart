import 'package:doctor_appointment_client/app/screens/appointments_screen.dart';
import 'package:doctor_appointment_client/app/screens/doctor_detail_screen.dart';
import 'package:doctor_appointment_client/app/screens/doctor_list_screen.dart';
import 'package:doctor_appointment_client/app/screens/main_screen.dart';
import 'package:doctor_appointment_client/app/screens/login_screen.dart';
import 'package:doctor_appointment_client/app/screens/register_screen.dart';
import 'package:doctor_appointment_client/app/screens/user_screen.dart';
import 'package:go_router/go_router.dart';

// GoRouter configuration
final router = GoRouter(
  routes: [
    GoRoute(path: '/', builder: (context, state) => const MainScreen()),
    GoRoute(path: '/user', builder: (context, state) => const UserInfoScreen()),
    GoRoute(
      path: '/doctors',
      builder: (context, state) => const DoctorListScreen(),
    ),
    GoRoute(
        path: '/doctors/:doctorId',
        builder: ((context, state) =>
            DoctorDetailScreen(id: state.pathParameters['doctorId']!)))
  ],
);
