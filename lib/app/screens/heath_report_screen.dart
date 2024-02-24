import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

class HealthReportScreen extends StatelessWidget {
  const HealthReportScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Align(
          alignment: width < 465 ? Alignment.center : Alignment.topLeft,
          child: Wrap(
            // alignment: WrapAlignment.s,
            spacing: 10,
            children: [
              MedicalCard(
                imageSrc: 'assets/images/medical_check.svg',
                title: "General Health",
                onTap: () {
                  context.push('/health/general');
                },
              ),
              MedicalCard(
                imageSrc: 'assets/images/lab.svg',
                title: "Laboratory Test",
                onTap: () {
                  context.push('/health/laboratory');
                },
              ),
              MedicalCard(
                imageSrc: 'assets/images/good_result.svg',
                title: "Physical Health",
                onTap: () {
                  context.push('/health/physical');
                },
              ),
              MedicalCard(
                imageSrc: 'assets/images/recommend_medicine.svg',
                title: "Medical Prescription",
                onTap: () {
                  // context.push('/prescription/2');
                  context.push("/prescription");
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class MedicalCard extends StatelessWidget {
  final String imageSrc;
  final String title;
  final Function onTap;

  const MedicalCard({
    required this.imageSrc,
    required this.title,
    required this.onTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return Card(
      color: Colors.white,
      elevation: 3,
      child: InkWell(
        onTap: () => onTap(),
        child: Column(
          children: [
            SvgPicture.asset(
              imageSrc,
              width: width < 465 ? 350 : 200,
              // height: 200,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Text(title,
                  style: Theme.of(context)
                      .textTheme
                      .headlineMedium!
                      .copyWith(fontSize: 16)),
            )
          ],
        ),
      ),
    );
  }
}
