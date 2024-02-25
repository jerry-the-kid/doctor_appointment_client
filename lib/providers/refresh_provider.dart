import 'package:doctor_appointment_client/constants/helpers.dart';
import 'package:flutter/material.dart';

class KeyRefreshProvider extends ChangeNotifier {
  String bookingKey;

  KeyRefreshProvider({this.bookingKey = ""});

  void setRefreshProvider() {
    bookingKey = Helpers().generateRandomKey();
    notifyListeners();
  }
}
