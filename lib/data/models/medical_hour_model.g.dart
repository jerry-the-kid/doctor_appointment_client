// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'medical_hour_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MedicalHourModel _$MedicalHourModelFromJson(Map<String, dynamic> json) =>
    MedicalHourModel(
      DateTime.parse(json['timeOfDay'] as String),
      json['description'] as String,
    );

Map<String, dynamic> _$MedicalHourModelToJson(MedicalHourModel instance) =>
    <String, dynamic>{
      'description': instance.description,
      'timeOfDay': instance.timeOfDay.toIso8601String(),
    };
