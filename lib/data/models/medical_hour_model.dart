import 'package:json_annotation/json_annotation.dart';

part 'medical_hour_model.g.dart';

enum DayPeriod { morning, afternoon, night }

DayPeriod getDayPeriod(String userInput) {
  switch (userInput.toLowerCase()) {
    case "morning":
      return DayPeriod.morning;
    case "afternoon":
      return DayPeriod.afternoon;
    case "night":
      return DayPeriod.night;
    default:
      throw ArgumentError(
          'Invalid time of day string: $userInput'); // Add a default value for unrecognized input
  }
}

@JsonSerializable()
class MedicalHourModel {
  final String description;
  final DateTime timeOfDay;

  MedicalHourModel(this.timeOfDay, this.description);

  factory MedicalHourModel.fromJson(Map<String, dynamic> json) =>
      _$MedicalHourModelFromJson(json);

  Map<String, dynamic> toJson() => _$MedicalHourModelToJson(this);
}

var morning =
    MedicalHourModel(DateTime.now().copyWith(hour: 9, minute: 0), "1 Morning");
var lunch = MedicalHourModel(
    DateTime.now().copyWith(hour: 12, minute: 0), "1 Afternoon");
var night =
    MedicalHourModel(DateTime.now().copyWith(hour: 20, minute: 0), "1 Night");
