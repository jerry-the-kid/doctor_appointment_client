import 'package:flutter/material.dart';

class ImageHeader extends StatelessWidget {
  final String imageSrc;

  const ImageHeader({super.key, required this.imageSrc});
  // 'assets/images/background_1.jpg',
  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      SizedBox(
        height: 200,
        child: Image.asset(
          imageSrc,
          alignment: Alignment.topCenter,
          fit: BoxFit.cover, // This ensures the image covers the entire space
          width: double.infinity,
        ),
      ),
      const Positioned(
          bottom: 10,
          left: 20, // Adjust the top position as needed
          child: Row(
            children: [
              Icon(
                Icons.local_hospital,
                color: Colors.white,
                size: 40,
              ),
              SizedBox(width: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("SaiGon General Hospital",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold)),
                  Text("Founding members, Hao and Thien",
                      style: TextStyle(
                        color: Colors.white,
                      ))
                ],
              )
            ],
          )),
    ]);
  }
}
