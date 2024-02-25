import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:doctor_appointment_client/data/models/booking_model.dart';

class BookingService {
  final CollectionReference _bookingCollectionReference =
      FirebaseFirestore.instance.collection('bookings');

  Future<void> createBooking({required BookingModel bookingModel}) async {
    await _bookingCollectionReference.add(bookingModel.toJson());
  }

  Future<List<BookingModel>> getAllBookings() async {
    List<BookingModel> bookings = [];
    QuerySnapshot querySnapshot = await _bookingCollectionReference.get();

    for (var doc in querySnapshot.docs) {
      Map<String, dynamic> bookingData = doc.data() as Map<String, dynamic>;
      BookingModel booking = BookingModel.fromJson(bookingData);
      booking.id = doc.id;
      bookings.add(booking);
    }

    return bookings;
  }

  Future<void> updateBooking(
      {required String uid, required Map<Object, Object?> data}) async {
    await _bookingCollectionReference.doc(uid).update(data);
  }
}
