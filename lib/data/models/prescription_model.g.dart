// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'prescription_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PrescriptionModel _$PrescriptionModelFromJson(Map<String, dynamic> json) =>
    PrescriptionModel(
      id: json['id'] as String?,
      userId: json['userId'] as String,
      doctorName: json['doctorName'] as String,
      title: json['title'] as String,
      specialistIn: json['specialistIn'] as String,
      avatarUrl: json['avatarUrl'] as String,
      createdDate: DateTime.parse(json['createdDate'] as String),
      chiefComplaints: json['chiefComplaints'] as String,
      clinicalFindings: json['clinicalFindings'] as String,
      diagnosis: json['diagnosis'] as String,
      medicines: (json['medicines'] as List<dynamic>)
          .map((e) => (e as Map<String, dynamic>).map(
                (k, e) => MapEntry(k, e as Object),
              ))
          .toList(),
      advices: json['advices'] as String,
    );

Map<String, dynamic> _$PrescriptionModelToJson(PrescriptionModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'userId': instance.userId,
      'doctorName': instance.doctorName,
      'title': instance.title,
      'specialistIn': instance.specialistIn,
      'avatarUrl': instance.avatarUrl,
      'createdDate': instance.createdDate.toIso8601String(),
      'chiefComplaints': instance.chiefComplaints,
      'clinicalFindings': instance.clinicalFindings,
      'diagnosis': instance.diagnosis,
      'medicines': instance.medicines,
      'advices': instance.advices,
    };
