// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'laboratory_report.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LaboratoryReportModel _$LaboratoryReportModelFromJson(
        Map<String, dynamic> json) =>
    LaboratoryReportModel(
      userId: json['userId'] as String,
      createdDate: DateTime.parse(json['createdDate'] as String),
      name: json['name'] as String? ?? "Laboratory Test",
      vdrl: json['vdrl'] as String? ?? "NEG",
      agHBs: json['agHBs'] as String? ?? "NEG (0.55)",
      antiHbs: json['antiHbs'] as String? ?? "POS (18.88)",
      antiHcv: json['antiHcv'] as String? ?? "NEG (0.287)",
      urobilinogen: json['urobilinogen'] as String? ?? "17 umon/L",
      bilirubin: json['bilirubin'] as String? ?? "17 umon/L",
      ketone: json['ketone'] as String? ?? "NEG",
      blood: json['blood'] as String? ?? "NEG",
      protein: json['protein'] as String? ?? "0.3 g/L",
      nitrite: json['nitrite'] as String? ?? "NEG",
      leucocytes: json['leucocytes'] as String? ?? "NEG",
      glucose: json['glucose'] as String? ?? "NEG",
      specificGravity: json['specificGravity'] as String? ?? "1.030",
      pH: json['pH'] as String? ?? "<= 6",
      wbc: json['wbc'] as String? ?? "6.20",
      wbc2: json['wbc2'] as String? ?? "4.70",
      plt: json['plt'] as String? ?? "264",
    );

Map<String, dynamic> _$LaboratoryReportModelToJson(
        LaboratoryReportModel instance) =>
    <String, dynamic>{
      'userId': instance.userId,
      'createdDate': instance.createdDate.toIso8601String(),
      'name': instance.name,
      'vdrl': instance.vdrl,
      'agHBs': instance.agHBs,
      'antiHbs': instance.antiHbs,
      'antiHcv': instance.antiHcv,
      'urobilinogen': instance.urobilinogen,
      'bilirubin': instance.bilirubin,
      'ketone': instance.ketone,
      'blood': instance.blood,
      'protein': instance.protein,
      'nitrite': instance.nitrite,
      'leucocytes': instance.leucocytes,
      'glucose': instance.glucose,
      'specificGravity': instance.specificGravity,
      'pH': instance.pH,
      'wbc': instance.wbc,
      'wbc2': instance.wbc2,
      'plt': instance.plt,
    };
