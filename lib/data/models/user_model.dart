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

  UserModel(
      {required this.id,
      required this.email,
      required this.userName,
      this.age,
      this.weight,
      this.gender,
      this.firstCreate = true});

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserModelToJson(this);
}
