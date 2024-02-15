import 'package:carousel_slider/carousel_slider.dart';
import 'package:doctor_appointment_client/app/widgets/primary_full_btn.dart';
import 'package:doctor_appointment_client/constants/app_colors.dart';
import 'package:doctor_appointment_client/services/auth_service.dart';
import 'package:doctor_appointment_client/services/user_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

class OnBoardScreen extends StatefulWidget {
  final String name;

  const OnBoardScreen({super.key, required this.name});

  @override
  State<OnBoardScreen> createState() => _OnBoardScreenState();
}

class _OnBoardScreenState extends State<OnBoardScreen> {
  String gender = 'male';
  int age = 20;
  int weight = 50;
  int pageIndex = 0;

  void handleChangeGender(String newGender) {
    if (gender == newGender) return;
    setState(() {
      gender = newGender;
    });
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;

    var firstScreen = Padding(
      padding: const EdgeInsets.all(20),
      child: Align(
        alignment: Alignment.center,
        child: Container(
          margin: EdgeInsets.only(top: height * 0.18),
          constraints: const BoxConstraints(maxWidth: 450),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                "Welcome, ${widget.name}!",
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                "You have successfully registered with our medical app and we happy to have you with us! You have taken the first step towards improving your health and well-being.",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16),
              ),
              const SizedBox(
                height: 20,
              ),
              Image.asset('assets/images/first_page.png'),
            ],
          ),
        ),
      ),
    );

    var secondScreen = Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Row(
            children: [
              Spacer(),
              Text(
                "1",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: AppColors.orange,
                    fontSize: 18),
              ),
              Text(
                "/3",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              )
            ],
          ),
          Align(
            alignment: Alignment.center,
            child: Container(
              constraints: const BoxConstraints(maxWidth: 400),
              child: Column(
                children: [
                  const Text(
                    "What is your gender",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    "Knowing the gender allows doctors to get additional information about the patient, which can be important part of the medical history",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(
                    height: height * 0.15,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: InkWell(
                          onTap: () {
                            handleChangeGender('male');
                          },
                          child: Container(
                            decoration: BoxDecoration(
                                border: Border.all(
                                  color: gender == 'male'
                                      ? AppColors.orange
                                      : Colors.grey,
                                ),
                                borderRadius: BorderRadius.circular(10)),
                            padding: const EdgeInsets.all(10),
                            child: Column(children: [
                              SvgPicture.asset(
                                'assets/images/male.svg',
                                height: 200,
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              const Text(
                                "Male",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ]),
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: InkWell(
                          onTap: () {
                            handleChangeGender('female');
                          },
                          child: Container(
                            decoration: BoxDecoration(
                                border: Border.all(
                                  color: gender == 'female'
                                      ? AppColors.orange
                                      : Colors.grey,
                                ),
                                borderRadius: BorderRadius.circular(10)),
                            padding: const EdgeInsets.all(10),
                            child: Column(children: [
                              SvgPicture.asset(
                                'assets/images/female.svg',
                                height: 200,
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              const Text(
                                "Male",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ]),
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );

    var thirdScreen = Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              IconButton(
                  onPressed: () {
                    setState(() {
                      pageIndex = pageIndex - 1;
                    });
                  },
                  icon: const Icon(Icons.arrow_back)),
              const Spacer(),
              const Text(
                "2",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: AppColors.orange,
                    fontSize: 18),
              ),
              const Text(
                "/3",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              )
            ],
          ),
          Align(
            alignment: Alignment.center,
            child: Container(
              constraints: const BoxConstraints(maxWidth: 400),
              child: Column(
                children: [
                  const Text(
                    "How old are you?",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    "Taking the patients' age into account is an important aspect of an individualized approach to providing medical care and ensuring the safety and effectiveness of treatment.",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(
                    height: height * 0.15,
                  ),
                  CustomCarousel(
                    key: const Key("age"),
                    value: age,
                    initialPage: age - 1,
                    callback: (index) {
                      setState(() {
                        age = index + 1;
                      });
                    },
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );

    var fourthScreen = Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              IconButton(
                  onPressed: () {
                    setState(() {
                      pageIndex = pageIndex - 1;
                    });
                  },
                  icon: const Icon(Icons.arrow_back)),
              const Spacer(),
              const Text(
                "3",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: AppColors.orange,
                    fontSize: 18),
              ),
              const Text(
                "/3",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              )
            ],
          ),
          Align(
            alignment: Alignment.center,
            child: Container(
              constraints: const BoxConstraints(maxWidth: 400),
              child: Column(
                children: [
                  const Text(
                    "What is your weight?",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    "Weight is an important parameter when assessing the patient's general condition and diagnosing various diseases",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(
                    height: height * 0.15,
                  ),
                  CustomCarousel(
                    key: const Key('weight'),
                    value: weight,
                    initialPage: weight - 1,
                    callback: (index) {
                      setState(() {
                        weight = index + 1;
                      });
                    },
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );

    return Scaffold(
      // backgroundColor: AppColors.bg,
      floatingActionButton: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: PrimaryFullBtn(
          title: pageIndex == 0 ? 'Get Started' : 'Save',
          onPressed: () {
            setState(() {
              if (pageIndex < 3) {
                pageIndex = pageIndex + 1;
              } else {
                UserService().updateUser(uid: Auth().currentUser!.uid, data: {
                  "age": age,
                  "weight": weight,
                  "gender": gender,
                  "firstCreate": false,
                }).then((value) => context.go('/'));
              }
            });
          },
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: Builder(builder: (context) {
        if (pageIndex == 1) {
          return secondScreen;
        } else if (pageIndex == 2) {
          return thirdScreen;
        } else if (pageIndex == 3) {
          return fourthScreen;
        }
        return firstScreen;
      }),
    );
  }
}

class CustomCarousel extends StatelessWidget {
  const CustomCarousel({
    super.key,
    required this.value,
    required this.callback,
    required this.initialPage,
  });

  final int value;
  final Function(int) callback;
  final int initialPage;

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      items: [
        ...[for (var i = 1; i < 151; i += 1) i].toList().map((e) => Container(
              width: double.infinity,
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                  border: e == value
                      ? Border.all(color: AppColors.orange)
                      : Border.all(),
                  borderRadius: BorderRadius.circular(7)),
              child: Center(
                  child: Text(
                e.toString(),
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 28),
              )),
            ))
      ],
      options: CarouselOptions(
        // height: 300,
        initialPage: initialPage,
        aspectRatio: 16 / 9,
        viewportFraction: .43,
        enlargeCenterPage: true,
        onPageChanged: (index, reason) {
          callback(index);
        },
      ),
    );
  }
}
