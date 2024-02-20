import 'package:doctor_appointment_client/data/models/card_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user_model.g.dart';

@JsonSerializable()
class UserModel {
  String id;
  String email;
  String userName;
  bool firstCreate;
  String avatarImage;
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
    this.avatarImage =
        'https://i.pinimg.com/originals/f5/fd/14/f5fd146c41549072d5a7823e31ea8eae.png',
    this.cards,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserModelToJson(this);
}
