import 'package:json_annotation/json_annotation.dart';

part 'pill_model.g.dart';

@JsonSerializable()
class PillModel {
  String userId;
  DateTime date;
  List<String> medicalHours;
  String name;
  String type;

  PillModel({
    required this.userId,
    required this.medicalHours,
    required this.date,
    required this.name,
    required this.type,
  });

  factory PillModel.fromJson(Map<String, dynamic> json) =>
      _$PillModelFromJson(json);

  Map<String, dynamic> toJson() => _$PillModelToJson(this);
}

List<PillModel> filterPillsByDateTime(
    List<PillModel> pills, DateTime dateTime) {
  int inputMonth = dateTime.month;
  int inputDay = dateTime.day;
  int inputYear = dateTime.year;

  return pills.where((pill) {
    int pillMonth = pill.date.month;
    int pillDay = pill.date.day;
    int pillYear = pill.date.year;

    return inputMonth == pillMonth &&
        inputDay == pillDay &&
        inputYear == pillYear;
  }).toList();
}

List<PillModel> filterPillsByMedicalHour(List<PillModel> pills, String hour) {
  return pills.where((pill) {
    return pill.medicalHours.contains(hour);
  }).toList();
}

bool isCurrentTimeActive(DateTime date, String hour) {
  DateTime now = DateTime.now();

  // Compare date month and year only
  if (date.month == now.month && date.year == now.year) {
    // Check if the current time falls within the specified time range for the given hour
    if (hour == "morning" && now.hour >= 0 && now.hour < 10) {
      return true;
    } else if (hour == "afternoon" && now.hour >= 10 && now.hour < 18) {
      return true;
    } else if (hour == "night" && (now.hour >= 18 || now.hour < 1)) {
      return true;
    }
  }

  return false;
}
