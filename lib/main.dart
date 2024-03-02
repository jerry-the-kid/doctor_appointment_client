import 'dart:ui';

import 'package:doctor_appointment_client/config/routes/routes.dart';
import 'package:doctor_appointment_client/config/theme/theme.dart';
import 'package:doctor_appointment_client/providers/booking_provider.dart';
import 'package:doctor_appointment_client/providers/refresh_provider.dart';
import 'package:doctor_appointment_client/providers/user_provider.dart';
import 'package:doctor_appointment_client/services/local_notification_service.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:provider/provider.dart';
import 'dart:io' show Platform;

import 'firebase_options.dart';

void configLoading() {
  EasyLoading.instance
    ..displayDuration = const Duration(milliseconds: 2000)
    ..indicatorType = EasyLoadingIndicatorType.ring
    ..loadingStyle = EasyLoadingStyle.dark;
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (Platform.isAndroid) {
    await LocalNotificationService.init();
  }

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
  configLoading();
}

class MyCustomScrollBehavior extends MaterialScrollBehavior {
  @override
  Set<PointerDeviceKind> get dragDevices => {
        PointerDeviceKind.touch,
        PointerDeviceKind.mouse,
        // etc.
      };
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => KeyRefreshProvider()),
        ChangeNotifierProvider(create: (context) => BookingProvider()),
        ChangeNotifierProvider(create: (context) => UserProvider()),
      ],
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        scrollBehavior: MyCustomScrollBehavior(),
        builder: EasyLoading.init(),
        title: 'Flutter Demo',
        theme: theme(),
        routerConfig: router,
      ),
    );
  }
}

// class MyHomePage extends StatefulWidget {
//   const MyHomePage({super.key});

//   @override
//   State<MyHomePage> createState() => _MuHomePageState();
// }

// class _MuHomePageState extends State<MyHomePage> {
//   final postService =
//       PostService(Dio(BaseOptions(contentType: 'application/json')));

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         body: FutureBuilder(
//             future: postService.getPosts(),
//             builder: (context, snapshot) {
//               if (snapshot.connectionState == ConnectionState.done) {
//                 final List<PostModel> posts = snapshot.data ?? [];
//                 return _post(posts);
//               } else {
//                 return const Center(child: CircularProgressIndicator());
//               }
//             }));
//   }

//   Widget _post(List<PostModel> posts) {
//     return ListView.builder(
//         itemCount: posts.length,
//         itemBuilder: (context, index) {
//           return Container(
//             margin: const EdgeInsets.all(16),
//             padding: const EdgeInsets.all(16),
//             decoration: BoxDecoration(
//               color: Colors.white,
//               borderRadius: BorderRadius.circular(10),
//               border: Border.all(color: Colors.black38, width: 1),
//             ),
//             child: Column(
//               children: [
//                 Text(
//                   posts[index].title,
//                   style: const TextStyle(fontWeight: FontWeight.bold),
//                 ),
//                 const SizedBox(
//                   height: 10,
//                 ),
//                 Text(
//                   posts[index].body,
//                 ),
//               ],
//             ),
//           );
//         });
//   }
// }
