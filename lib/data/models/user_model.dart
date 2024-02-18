import 'package:doctor_appointment_client/data/models/card_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user_model.g.dart';

@JsonSerializable()
class UserModel {
  String id;
  String email;
  String userName;
  bool firstCreate;
  String? gender;
  int? weight;
  int? age;
  List<CardModel>? cards;

  UserModel({
    required this.id,
    required this.email,
    required this.userName,
    this.age,
    this.weight,
    this.gender,
    this.firstCreate = true,
    this.cards,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserModelToJson(this);
}
