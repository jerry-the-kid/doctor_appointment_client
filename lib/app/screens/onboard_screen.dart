import 'package:carousel_slider/carousel_slider.dart';
import 'package:doctor_appointment_client/app/widgets/input.dart';
import 'package:doctor_appointment_client/app/widgets/primary_full_btn.dart';
import 'package:doctor_appointment_client/constants/app_colors.dart';
import 'package:doctor_appointment_client/constants/helpers.dart';
import 'package:doctor_appointment_client/services/auth_service.dart';
import 'package:doctor_appointment_client/services/user_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

class OnBoardScreen extends StatefulWidget {
  final String name;
  final VoidCallback onSubmit;

  const OnBoardScreen({super.key, required this.name, required this.onSubmit});

  @override
  State<OnBoardScreen> createState() => _OnBoardScreenState();
}

class _OnBoardScreenState extends State<OnBoardScreen> {
  String gender = 'male';
  int age = 20;
  int weight = 50;
  int pageIndex = 0;

  final _formKey = GlobalKey<FormState>();
  final _heighController = TextEditingController();

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
                                "Female",
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
                    "What is your weight? (kg)",
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

    var fifthScreen = Padding(
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
                "/4",
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
                    "What is your height? (cm)",
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
                    "Height is an important parameter when assessing the patient's general condition and diagnosing various diseases",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(
                    height: height * 0.25,
                  ),
                  Form(
                      key: _formKey,
                      child: TextFormField(
                        controller: _heighController,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          hintStyle: const TextStyle(fontSize: 14),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your height';
                          } else if (!Helpers().isAllNumbers(value)) {
                            return 'Height must not have characters';
                          }
                          return null;
                        },
                      )),
                ],
              ),
            ),
          ),
        ],
      ),
    );

    var title = 'Save';

    if (pageIndex == 0) title = "Get Started";
    if (pageIndex == 4) title = "Completed";

    return Scaffold(
      // backgroundColor: AppColors.bg,
      floatingActionButton: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: PrimaryFullBtn(
          title: title,
          onPressed: () {
            setState(() {
              if (pageIndex < 4) {
                pageIndex = pageIndex + 1;
              } else {
                if (_formKey.currentState!.validate()) {
                  _formKey.currentState!.save();

                  UserService().updateUser(uid: Auth().currentUser!.uid, data: {
                    "age": age,
                    "weight": weight,
                    "gender": gender,
                    "height": int.parse(_heighController.text),
                    "firstCreate": false,
                  }).then((value) => context.push(
                      Uri(
                        path: '/appNotify',
                        queryParameters: {
                          'svgSrc': 'assets/images/done.svg',
                          'title': 'It\'s all checked!',
                          'description':
                              'Thanks for filling the information form.'
                        },
                      ).toString(),
                      extra: () => {widget.onSubmit()}));
                }
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
        } else if (pageIndex == 4) {
          return fifthScreen;
        }
        return firstScreen;
      }),
    );
  }
}

class CustomCarousel extends StatelessWidget {
  const CustomCarousel({
    super.key,
    this.isHeight = false,
    required this.value,
    required this.callback,
    required this.initialPage,
  });

  final int value;
  final Function(int) callback;
  final int initialPage;
  final bool isHeight;

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
