import 'package:json_annotation/json_annotation.dart';

part 'notification_model.g.dart';

@JsonSerializable()
class NotificationModel {
  String userId;
  String message;
  DateTime date;
  bool isRead;
  String? id;

  NotificationModel(
      {required this.userId,
      required this.message,
      required this.date,
      this.isRead = false,
      this.id});

  factory NotificationModel.fromJson(Map<String, dynamic> json) =>
      _$NotificationModelFromJson(json);

  Map<String, dynamic> toJson() => _$NotificationModelToJson(this);
}
