import 'dart:math';

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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add Card"),
      ),
      body: const SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(20.0),
          child: Column(children: [
            Align(
              alignment: Alignment.center,
              child: VisaCard(),
            ),
            SizedBox(
              height: 30,
            ),
          ]),
        ),
      ),
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
