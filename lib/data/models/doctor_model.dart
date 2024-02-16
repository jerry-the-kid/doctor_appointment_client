import 'package:json_annotation/json_annotation.dart';

part 'doctor_model.g.dart';

@JsonSerializable()
class DoctorModel {
  String? id;
  String name;
  String title;
  String specialistIn;
  String description;
  String avatarUrl;

  DoctorModel({
    this.id,
    required this.name,
    required this.title,
    required this.specialistIn,
    required this.description,
    required this.avatarUrl,
  });

  factory DoctorModel.fromJson(Map<String, dynamic> json) =>
      _$DoctorModelFromJson(json);

  Map<String, dynamic> toJson() => _$DoctorModelToJson(this);
}
