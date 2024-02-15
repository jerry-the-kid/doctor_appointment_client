import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:doctor_appointment_client/data/models/user_model.dart';

class UserService {
  final CollectionReference _userCollectionReference =
      FirebaseFirestore.instance.collection('users');

  Future<void> createUser(
      {required String uid, required UserModel userModel}) async {
    await _userCollectionReference.doc(uid).set(userModel.toJson());
  }

  Future<void> updateUser(
      {required String uid, required Map<Object, Object?> data}) async {
    await _userCollectionReference.doc(uid).update(data);
  }
}
