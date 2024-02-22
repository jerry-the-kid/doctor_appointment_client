import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:doctor_appointment_client/data/models/booking_model.dart';

class BookingService {
  final CollectionReference _bookingCollectionReference =
      FirebaseFirestore.instance.collection('bookings');

  Future<void> createBooking({required BookingModel bookingModel}) async {
    await _bookingCollectionReference.add(bookingModel.toJson());
  }
}
