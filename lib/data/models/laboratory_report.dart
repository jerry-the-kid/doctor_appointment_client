import 'package:json_annotation/json_annotation.dart';

part 'laboratory_report.g.dart';

@JsonSerializable()
class LaboratoryReportModel {
  String userId;
  DateTime createdDate;
  String name;
  String vdrl;
  String agHBs;
  String antiHbs;
  String antiHcv;
  String urobilinogen;
  String bilirubin;
  String ketone;
  String blood;
  String protein;
  String nitrite;
  String leucocytes;
  String glucose;
  String specificGravity;
  String pH;
  String wbc;
  String wbc2;
  String plt;

  LaboratoryReportModel(
      {required this.userId,
      required this.createdDate,
      this.name = "Laboratory Test",
      this.vdrl = "NEG",
      this.agHBs = "NEG (0.55)",
      this.antiHbs = "POS (18.88)",
      this.antiHcv = "NEG (0.287)",
      this.urobilinogen = "17 umon/L",
      this.bilirubin = "17 umon/L",
      this.ketone = "NEG",
      this.blood = "NEG",
      this.protein = "0.3 g/L",
      this.nitrite = "NEG",
      this.leucocytes = "NEG",
      this.glucose = "NEG",
      this.specificGravity = "1.030",
      this.pH = "<= 6",
      this.wbc = "6.20",
      this.wbc2 = "4.70",
      this.plt = "264"});

  // factory HealthReportModel.fromJson(Map<String, dynamic> json) =>
  //     _$HealthReportModelFromJson(json);

  // Map<String, dynamic> toJson() => _$HealthReportModelToJson(this);
}
