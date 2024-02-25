import 'package:doctor_appointment_client/data/models/medicine_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'prescription_model.g.dart';

@JsonSerializable()
class PrescriptionModel {
  String userId;
  String doctorName;
  String title;
  String specialistIn;
  String avatarUrl;
  DateTime createdDate;
  String chiefComplaints;
  String clinicalFindings;
  String diagnosis;
  List<Map<String, Object>> medicines;
  String advices;

  PrescriptionModel(
      {required this.userId,
      required this.doctorName,
      required this.title,
      required this.specialistIn,
      required this.avatarUrl,
      required this.createdDate,
      required this.chiefComplaints,
      required this.clinicalFindings,
      required this.diagnosis,
      required this.medicines,
      required this.advices});

  factory PrescriptionModel.fromJson(Map<String, dynamic> json) =>
      _$PrescriptionModelFromJson(json);

  Map<String, dynamic> toJson() => _$PrescriptionModelToJson(this);
}
