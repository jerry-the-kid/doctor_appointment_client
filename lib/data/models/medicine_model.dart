import 'package:doctor_appointment_client/data/models/medical_hour_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'medicine_model.g.dart';

@JsonSerializable()
class MedicineModel {
  String name;
  String type;
  int duration;
  List<String> medicalHours;

  MedicineModel(
      {required this.name,
      required this.type,
      required this.medicalHours,
      required this.duration});

  factory MedicineModel.fromJson(Map<String, dynamic> json) =>
      _$MedicineModelFromJson(json);

  Map<String, dynamic> toJson() => _$MedicineModelToJson(this);
}
