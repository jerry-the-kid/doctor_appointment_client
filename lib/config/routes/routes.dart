import 'package:doctor_appointment_client/app/screens/add_card_screen.dart';
import 'package:doctor_appointment_client/app/screens/cancel_appointment.dart';
import 'package:doctor_appointment_client/app/screens/checkup_appointment_screen.dart';
import 'package:doctor_appointment_client/app/screens/doctor_detail_screen.dart';
import 'package:doctor_appointment_client/app/screens/doctor_list_screen.dart';
import 'package:doctor_appointment_client/app/screens/general_health_screen.dart';
import 'package:doctor_appointment_client/app/screens/laboratory_test_screen.dart';
import 'package:doctor_appointment_client/app/screens/notification_screen.dart';
import 'package:doctor_appointment_client/app/screens/payment_methods_screen.dart';
import 'package:doctor_appointment_client/app/screens/physical_health_screen.dart';
import 'package:doctor_appointment_client/app/screens/register_screen.dart';
import 'package:doctor_appointment_client/app/screens/user_screen.dart';
import 'package:doctor_appointment_client/app/widgets/widget_tree.dart';
import 'package:go_router/go_router.dart';

// GoRouter configuration
final router = GoRouter(
  routes: [
    GoRoute(path: '/', builder: (context, state) => const WidgetTreeState()),
    GoRoute(
        path: '/register', builder: (context, state) => const RegisterScreen()),
    // GoRoute(
    //     path: '/',
    //     builder: (context, state) => const CheckupAppointmentScreen()),
    GoRoute(
        path: '/payments',
        builder: (context, state) => const PaymentMethodScreen()),
    GoRoute(
        path: '/payments/add',
        builder: ((context, state) => const AddCardScreen())),
    GoRoute(
      path: '/checkup',
      builder: (context, state) => const CheckupAppointmentScreen(),
    ),
    GoRoute(
        path: '/appointment/cancel',
        builder: (context, state) => const CancelAppointment()),
    GoRoute(path: '/user', builder: (context, state) => const UserInfoScreen()),
    GoRoute(
        path: '/notification',
        builder: (context, state) => const NotificationScreen()),
    GoRoute(
        path: '/health/laboratory',
        builder: (context, state) => const LaboratoryTestScreen()),
    GoRoute(
        path: '/health/general',
        builder: (context, state) => const GeneralHealthScreen()),
    GoRoute(
        path: '/health/physical',
        builder: (context, state) => const PhysicalHealthScreen()),
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
