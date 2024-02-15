// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserModel _$UserModelFromJson(Map<String, dynamic> json) => UserModel(
      id: json['id'] as String,
      email: json['email'] as String,
      userName: json['userName'] as String,
      age: json['age'] as int?,
      weight: json['weight'] as int?,
      gender: json['gender'] as String?,
      firstCreate: json['firstCreate'] as bool? ?? true,
    );

Map<String, dynamic> _$UserModelToJson(UserModel instance) => <String, dynamic>{
      'id': instance.id,
      'email': instance.email,
      'userName': instance.userName,
      'firstCreate': instance.firstCreate,
      'gender': instance.gender,
      'weight': instance.weight,
      'age': instance.age,
    };
