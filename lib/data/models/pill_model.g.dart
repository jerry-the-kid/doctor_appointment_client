// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pill_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PillModel _$PillModelFromJson(Map<String, dynamic> json) => PillModel(
      userId: json['userId'] as String,
      medicalHours: (json['medicalHours'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      date: DateTime.parse(json['date'] as String),
      name: json['name'] as String,
      type: json['type'] as String,
    );

Map<String, dynamic> _$PillModelToJson(PillModel instance) => <String, dynamic>{
      'userId': instance.userId,
      'date': instance.date.toIso8601String(),
      'medicalHours': instance.medicalHours,
      'name': instance.name,
      'type': instance.type,
    };
