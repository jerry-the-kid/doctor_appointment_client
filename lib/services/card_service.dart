import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:doctor_appointment_client/data/models/card_model.dart';

class CardService {
  final CollectionReference _cardCollectionReference =
      FirebaseFirestore.instance.collection('cards');

  Future<CardModel?> getCardByCardInfo(
      {required String cardNumber,
      required String cvv,
      required String expiredDate,
      required String username}) async {
    QuerySnapshot querySnapshot = await _cardCollectionReference
        .where('cardNumber', isEqualTo: cardNumber)
        .where('userName', isEqualTo: username)
        .where('cvv', isEqualTo: cvv)
        .where('expiredDate', isEqualTo: expiredDate)
        .get();

    if (querySnapshot.docs.isNotEmpty) {
      QueryDocumentSnapshot documentSnapshot = querySnapshot.docs.first;

      Map<String, dynamic>? data =
          documentSnapshot.data() as Map<String, dynamic>?;

      if (data != null) {
        CardModel card = CardModel.fromJson(data);

        return card;
      }
    }

    return null;
  }

  // Future<void> createUser(
  //     {required String uid, required UserModel userModel}) async {
  //   await _userCollectionReference.doc(uid).set(userModel.toJson());
  // }

  // Future<void> updateUser(
  //     {required String uid, required Map<Object, Object?> data}) async {
  //   await _userCollectionReference.doc(uid).update(data);
  // }
}
