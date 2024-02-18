import 'package:doctor_appointment_client/data/models/doctor_model.dart';
import 'package:flutter/material.dart';

class BookingProvider extends ChangeNotifier {
  DateTime selectedDate;
  String selectedHour;
  DoctorModel? doctor;

  BookingProvider(
      {DateTime? selectedDate, this.selectedHour = "07:00 AM", this.doctor})
      : selectedDate = selectedDate ?? DateTime.now();

  void setDoctor({required DoctorModel doctor}) {
    this.doctor = doctor;
    notifyListeners();
  }

  void changeSelectedDate({required DateTime selectedDate}) {
    this.selectedDate = selectedDate;
    notifyListeners();
  }

  void changeSelectedHour({required String selectedHour}) {
    this.selectedHour = selectedHour;
    notifyListeners();
  }
}
