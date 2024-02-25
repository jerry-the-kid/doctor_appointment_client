import 'package:json_annotation/json_annotation.dart';

part 'booking_model.g.dart';

@JsonSerializable()
class BookingModel {
  DateTime selectedDate;
  DateTime createdDate;
  String userId;
  String doctorName;
  String title;
  String specialistIn;
  String avatarUrl;

  BookingModel({
    required this.selectedDate,
    required this.userId,
    required this.doctorName,
    required this.title,
    required this.specialistIn,
    required this.avatarUrl,
    required this.createdDate,
  });

  factory BookingModel.fromJson(Map<String, dynamic> json) =>
      _$BookingModelFromJson(json);

  Map<String, dynamic> toJson() => _$BookingModelToJson(this);
}

BookingModel findClosestBooking(
    List<BookingModel> bookings, DateTime targetDate) {
  BookingModel closestBooking = bookings.first;

  Duration minDifference =
      (closestBooking.selectedDate.difference(targetDate)).abs();

  for (int i = 1; i < bookings.length; i++) {
    BookingModel currentBooking = bookings[i];
    Duration difference =
        (currentBooking.selectedDate.difference(targetDate)).abs();

    if (difference < minDifference) {
      minDifference = difference;
      closestBooking = currentBooking;
    }
  }

  return closestBooking;
}
