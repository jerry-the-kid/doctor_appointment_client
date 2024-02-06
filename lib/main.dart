import 'dart:ui';

import 'package:doctor_appointment_client/config/routes/routes.dart';
import 'package:doctor_appointment_client/config/theme/theme.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyCustomScrollBehavior extends MaterialScrollBehavior {
  @override
  Set<PointerDeviceKind> get dragDevices => {
        PointerDeviceKind.touch,
        PointerDeviceKind.mouse,
        // etc.
      };
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      scrollBehavior: MyCustomScrollBehavior(),
      title: 'Flutter Demo',
      theme: theme(),
      routerConfig: router,
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
