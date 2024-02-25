import 'package:json_annotation/json_annotation.dart';

part 'booking_model.g.dart';

@JsonSerializable()
class BookingModel {
  DateTime selectedDate;
  DateTime createdDate;
  String userId;
  String doctorId;
  String doctorName;
  String title;
  String specialistIn;
  String avatarUrl;
  bool cancel;
  String? cancelReason;
  String? id;

  BookingModel({
    required this.selectedDate,
    required this.userId,
    required this.doctorId,
    required this.doctorName,
    required this.title,
    required this.specialistIn,
    required this.avatarUrl,
    required this.createdDate,
    this.cancel = false,
    this.cancelReason,
    this.id,
  });

  factory BookingModel.fromJson(Map<String, dynamic> json) =>
      _$BookingModelFromJson(json);

  Map<String, dynamic> toJson() => _$BookingModelToJson(this);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is BookingModel &&
        other.selectedDate == selectedDate &&
        other.createdDate == createdDate &&
        other.userId == userId &&
        other.doctorName == doctorName &&
        other.title == title &&
        other.specialistIn == specialistIn &&
        other.avatarUrl == avatarUrl &&
        other.cancel == cancel &&
        other.cancelReason == cancelReason;
  }
}

List<BookingModel> findCancelledOrPastBookings(List<BookingModel> bookings) {
  // Filter bookings where cancel is true or selectedDate is in the past
  return bookings.where((booking) {
    return booking.cancel || booking.selectedDate.isBefore(DateTime.now());
  }).toList();
}

List<BookingModel> findFutureBookingWithoutCancel(
    List<BookingModel> bookings, BookingModel exceptBooking) {
  return bookings.where((booking) {
    return !booking.cancel &&
        booking.selectedDate.isAfter(DateTime.now()) &&
        booking != exceptBooking;
  }).toList();
}

BookingModel? findClosestBooking(
    List<BookingModel> bookings, DateTime targetDate) {
  List<BookingModel> futureActiveBookings = bookings.where((booking) {
    return booking.selectedDate.isAfter(targetDate) && !booking.cancel;
  }).toList();

  if (futureActiveBookings.isEmpty) {
    return null;
  }

  BookingModel closestBooking = futureActiveBookings.reduce((a, b) {
    Duration differenceA = a.selectedDate.difference(targetDate).abs();
    Duration differenceB = b.selectedDate.difference(targetDate).abs();
    return differenceA < differenceB ? a : b;
  });

  return closestBooking;
}
