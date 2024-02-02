import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class HealthReportScreen extends StatelessWidget {
  const HealthReportScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Health Data")),
      body: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              Row(
                children: [
                  Card(
                    child: Column(
                      children: [
                        SvgPicture.asset(
                          'assets/images/medical_check.svg',
                          width: 200,
                          height: 200,
                        ),
                      ],
                    ),
                  )
                ],
              )
            ],
          )

          // SizedBox(
          //   height: 500,
          //   child: ListView(children: [
          //     Row(
          //       children: [
          //         const Icon(Icons.summarize),
          //         const SizedBox(width: 15),
          //         const Text(
          //           "General Health",
          //           style: TextStyle(fontWeight: FontWeight.w500),
          //         ),
          //         const Spacer(),
          //         IconButton(
          //             onPressed: () {}, icon: const Icon(Icons.navigate_next))
          //       ],
          //     ),
          //     const SizedBox(height: 10),
          //     Row(
          //       children: [
          //         const Icon(Icons.biotech),
          //         const SizedBox(width: 15),
          //         const Text(
          //           "Laboratory Test",
          //           style: TextStyle(fontWeight: FontWeight.w500),
          //         ),
          //         const Spacer(),
          //         IconButton(
          //             onPressed: () {}, icon: const Icon(Icons.navigate_next))
          //       ],
          //     ),
          //   ]),
          // ),
          ),
    );
  }
}
