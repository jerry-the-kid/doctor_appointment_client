import 'package:doctor_appointment_client/data/models/user_model.dart';
import 'package:doctor_appointment_client/services/user_service.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Auth {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final UserService userService = UserService();

  User? get currentUser => _firebaseAuth.currentUser;

  Stream<User?> get authStateChanges => _firebaseAuth.authStateChanges();

  Future<void> signInWithEmailAndPassword(
      {required String email, required String password}) async {
    await _firebaseAuth.signInWithEmailAndPassword(
        email: email, password: password);
  }

  Future<void> createUserWithEmailAndPassword(
      {required String email, required String password}) async {
    UserCredential userCredential = await _firebaseAuth
        .createUserWithEmailAndPassword(email: email, password: password);

    print(userCredential);

    await userService.createUser(
        uid: userCredential.user!.uid,
        userModel: UserModel(id: userCredential.user!.uid, email: email));
  }

  Future<void> signOut() async {
    await FirebaseAuth.instance.signOut();
  }
}
