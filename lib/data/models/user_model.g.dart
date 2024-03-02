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
      height: json['height'] as int?,
      gender: json['gender'] as String?,
      firstCreate: json['firstCreate'] as bool? ?? true,
      isFirstBooking: json['isFirstBooking'] as bool? ?? true,
      avatarImage: json['avatarImage'] as String? ??
          'https://i.pinimg.com/originals/f5/fd/14/f5fd146c41549072d5a7823e31ea8eae.png',
      cards: (json['cards'] as List<dynamic>?)
          ?.map((e) => CardModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$UserModelToJson(UserModel instance) => <String, dynamic>{
      'id': instance.id,
      'email': instance.email,
      'userName': instance.userName,
      'firstCreate': instance.firstCreate,
      'avatarImage': instance.avatarImage,
      'gender': instance.gender,
      'weight': instance.weight,
      'age': instance.age,
      'height': instance.height,
      'cards': instance.cards,
      'isFirstBooking': instance.isFirstBooking,
    };
