import 'package:doctor_appointment_client/app/widgets/primary_full_btn.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

class AppNotifyScreen extends StatelessWidget {
  final String svgSrc;
  final String title;
  final String? description;
  final VoidCallback? onBtnClick;

  const AppNotifyScreen({
    super.key,
    required this.svgSrc,
    required this.title,
    this.onBtnClick,
    this.description,
  });

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
        floatingActionButton: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: PrimaryFullBtn(
            title: 'Go to Home Page',
            onPressed: () {
              if (onBtnClick != null) {
                onBtnClick!();
                context.pop();
              } else {
                context.go("/");
              }
            },
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: Align(
            alignment: Alignment.center,
            child: Container(
              margin: EdgeInsets.only(top: height * 0.18),
              constraints: const BoxConstraints(maxWidth: 350),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SvgPicture.asset(
                    // 'assets/images/trans_done.svg',
                    svgSrc,
                    height: 400,
                  ),
                  // const SizedBox(
                  //   height: 10,
                  // ),
                  Text(
                    // "Actions successful !",
                    title,
                    style: Theme.of(context)
                        .textTheme
                        .headlineMedium!
                        .copyWith(fontSize: 28),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    // "Everything will be fine!",
                    description ?? "",
                    style: Theme.of(context)
                        .textTheme
                        .headlineMedium!
                        .copyWith(fontWeight: FontWeight.w300),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
