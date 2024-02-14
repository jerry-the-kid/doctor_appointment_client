import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:doctor_appointment_client/data/models/user_model.dart';

class UserService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> createUser(
      {required String uid, required UserModel userModel}) async {
    await _firestore.collection('users').doc(uid).set(userModel.toJson());
  }
}
