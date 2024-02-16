// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'doctor_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DoctorModel _$DoctorModelFromJson(Map<String, dynamic> json) => DoctorModel(
      id: json['id'] as String?,
      name: json['name'] as String,
      title: json['title'] as String,
      specialistIn: json['specialistIn'] as String,
      description: json['description'] as String,
      avatarUrl: json['avatarUrl'] as String,
    );

Map<String, dynamic> _$DoctorModelToJson(DoctorModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'title': instance.title,
      'specialistIn': instance.specialistIn,
      'description': instance.description,
      'avatarUrl': instance.avatarUrl,
    };
