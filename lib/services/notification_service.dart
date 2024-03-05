import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:doctor_appointment_client/data/models/notification_model.dart';
import 'package:doctor_appointment_client/services/auth_service.dart';

class NotificationService {
  final CollectionReference _notificationCollectionReference =
      FirebaseFirestore.instance.collection('notifications');

  Future<void> createNotification(
      {required NotificationModel notificationModel}) async {
    await _notificationCollectionReference.add(notificationModel.toJson());
  }

  Future<List<NotificationModel>> getNotifications(
      {required String specialistIn}) async {
    QuerySnapshot querySnapshot = await _notificationCollectionReference
        .where('userId', isEqualTo: Auth().currentUser!.uid)
        .get();

    List<NotificationModel> notifications = [];

    for (var doc in querySnapshot.docs) {
      Map<String, dynamic> doctorData = doc.data() as Map<String, dynamic>;
      NotificationModel notify = NotificationModel.fromJson(doctorData);
      notify.id = doc.id;
      notifications.add(notify);
    }

    return notifications;
  }

  Future<void> updateNotification(
      {required String uid, required Map<Object, Object?> data}) async {
    await _notificationCollectionReference.doc(uid).update(data);
  }
}
