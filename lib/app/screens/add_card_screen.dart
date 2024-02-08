import 'dart:math';

import 'package:doctor_appointment_client/app/widgets/full_btn.dart';
import 'package:doctor_appointment_client/constants/helpers.dart';
import 'package:flutter/material.dart';

double textScaleFactor(BuildContext context, {double maxTextScaleFactor = 2}) {
  final width = MediaQuery.of(context).size.width;
  double val = (width / 1400) * maxTextScaleFactor;
  return max(1, min(val, maxTextScaleFactor));
}

class AddCardScreen extends StatefulWidget {
  const AddCardScreen({super.key});

  @override
  State<AddCardScreen> createState() => _AddCardScreenState();
}

class _AddCardScreenState extends State<AddCardScreen> {
  final _formKey = GlobalKey<FormState>();
  final _cardHolderNameController = TextEditingController();
  final _cardNumberController = TextEditingController();
  final _cardExpiryDateController = TextEditingController();
  final _cardCvvController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add Card"),
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: PrimaryFullBtn(
          title: "Add Cart",
          onPressed: () {
            if (_formKey.currentState!.validate()) {
              _formKey.currentState!.save();
              // final snackBar = SnackBar(
              //   content: Text(_cardCvvController.text),
              // );
              // ScaffoldMessenger.of(context).showSnackBar(snackBar);
            }
          },
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              const Align(
                alignment: Alignment.center,
                child: VisaCard(),
              ),
              const SizedBox(
                height: 30,
              ),
              Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Input(
                      controller: _cardHolderNameController,
                      label: 'Card Holder Name',
                      placeholder: 'Your Name',
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter card holder name';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Input(
                      controller: _cardNumberController,
                      label: 'Card Number',
                      placeholder: 'Your Visa Number',
                      inputType: TextInputType.number,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter card number';
                        } else if (!Helpers().isAllNumbers(value)) {
                          return 'Card number must not have characters';
                        } else if (value.trim().length != 16) {
                          return 'Card number must have 16 digits';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Row(
                      children: [
                        Expanded(
                            child: Input(
                          controller: _cardExpiryDateController,
                          label: "Expiry Date",
                          placeholder: 'MM/YY',
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Please enter cvv's expiry date";
                            } else if (!Helpers().isStringMMYYFormat(value)) {
                              return 'Invalid expiry date';
                            }
                            return null;
                          },
                        )),
                        const SizedBox(width: 20),
                        Expanded(
                            child: Input(
                          controller: _cardCvvController,
                          label: "CVV",
                          placeholder: "000",
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Please enter cvv number";
                            } else if (value.trim().length != 3) {
                              return 'CVV number must have 3 digits';
                            }
                            return null;
                          },
                        )),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Input extends StatelessWidget {
  final String label;
  final String placeholder;
  final String? Function(String?)? validator;
  final TextInputType inputType;
  final TextEditingController? controller;

  const Input({
    super.key,
    this.placeholder = '',
    this.inputType = TextInputType.text,
    required this.label,
    required this.validator,
    this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: const TextStyle(fontSize: 14)),
        const SizedBox(
          height: 8,
        ),
        TextFormField(
          controller: controller,
          keyboardType: inputType,
          decoration: InputDecoration(
            hintText: placeholder,
            hintStyle: const TextStyle(fontSize: 14),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          validator: validator,
        )
      ],
    );
  }
}

class VisaCard extends StatelessWidget {
  const VisaCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    double creditCardFont = 25;
    double imageHeight = 20;

    if (width < 430) {
      creditCardFont = 20;
      imageHeight = 15;
    }

    return Container(
      width: 450,
      alignment: Alignment.center,
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.asset('assets/images/card_bg.png'),
          ),
          Positioned(
              top: 20,
              right: 20,
              child: Image.asset(
                'assets/images/visa.png',
                height: imageHeight,
              )),
          Positioned(
            left: 20,
            bottom: 80,
            child: Text(
              '4716 9627 1635 8047',
              style: TextStyle(
                  letterSpacing: 1,
                  fontWeight: FontWeight.w500,
                  fontSize: creditCardFont,
                  color: Colors.white),
            ),
          ),
          Positioned(
              bottom: 30,
              left: 20,
              right: 20,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Card holder name',
                        style: TextStyle(
                            fontSize: creditCardFont - 9,
                            color: Colors.white,
                            fontWeight: FontWeight.w300),
                      ),
                      Text(
                        "Esther Howard",
                        style: TextStyle(
                            fontSize: creditCardFont - 9,
                            color: Colors.white,
                            fontWeight: FontWeight.w500),
                      )
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Expiry Date',
                        style: TextStyle(
                            fontSize: creditCardFont - 9,
                            color: Colors.white,
                            fontWeight: FontWeight.w300),
                      ),
                      Text(
                        "02/30",
                        style: TextStyle(
                            fontSize: creditCardFont - 9,
                            color: Colors.white,
                            fontWeight: FontWeight.w500),
                      )
                    ],
                  ),
                  Image.asset('assets/images/chip_3.png',
                      height: imageHeight + 10),
                ],
              ))
        ],
      ),
    );
  }
}
