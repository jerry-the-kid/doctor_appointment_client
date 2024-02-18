import 'package:json_annotation/json_annotation.dart';

part 'card_model.g.dart';

@JsonSerializable()
class CardModel {
  String cardNumber;
  double currentBalance;
  String cvv;
  String expiredDate;
  String userName;

  CardModel(
      {required this.cardNumber,
      required this.currentBalance,
      required this.cvv,
      required this.expiredDate,
      required this.userName});

  factory CardModel.fromJson(Map<String, dynamic> json) =>
      _$CardModelFromJson(json);

  Map<String, dynamic> toJson() => _$CardModelToJson(this);
}
