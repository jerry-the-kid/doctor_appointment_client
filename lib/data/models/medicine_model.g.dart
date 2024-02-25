// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'medicine_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MedicineModel _$MedicineModelFromJson(Map<String, dynamic> json) =>
    MedicineModel(
      name: json['name'] as String,
      type: json['type'] as String,
      medicalHours: (json['medicalHours'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      duration: json['duration'] as int,
    );

Map<String, dynamic> _$MedicineModelToJson(MedicineModel instance) =>
    <String, dynamic>{
      'name': instance.name,
      'type': instance.type,
      'duration': instance.duration,
      'medicalHours': instance.medicalHours,
    };
