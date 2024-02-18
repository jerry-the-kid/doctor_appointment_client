// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'card_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CardModel _$CardModelFromJson(Map<String, dynamic> json) => CardModel(
      cardNumber: json['cardNumber'] as String,
      currentBalance: (json['currentBalance'] as num).toDouble(),
      cvv: json['cvv'] as String,
      expiredDate: json['expiredDate'] as String,
      userName: json['userName'] as String,
    );

Map<String, dynamic> _$CardModelToJson(CardModel instance) => <String, dynamic>{
      'cardNumber': instance.cardNumber,
      'currentBalance': instance.currentBalance,
      'cvv': instance.cvv,
      'expiredDate': instance.expiredDate,
      'userName': instance.userName,
    };
