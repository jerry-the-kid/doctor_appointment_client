// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'booking_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BookingModel _$BookingModelFromJson(Map<String, dynamic> json) => BookingModel(
      selectedDate: DateTime.parse(json['selectedDate'] as String),
      userId: json['userId'] as String,
      doctorName: json['doctorName'] as String,
      title: json['title'] as String,
      specialistIn: json['specialistIn'] as String,
      avatarUrl: json['avatarUrl'] as String,
      createdDate: DateTime.parse(json['createdDate'] as String),
    );

Map<String, dynamic> _$BookingModelToJson(BookingModel instance) =>
    <String, dynamic>{
      'selectedDate': instance.selectedDate.toIso8601String(),
      'createdDate': instance.createdDate.toIso8601String(),
      'userId': instance.userId,
      'doctorName': instance.doctorName,
      'title': instance.title,
      'specialistIn': instance.specialistIn,
      'avatarUrl': instance.avatarUrl,
    };
