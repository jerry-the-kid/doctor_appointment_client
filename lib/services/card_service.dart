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

  Future<void> updateCard(
      {required String cardNumber, required Map<Object, Object?> data}) async {
    await _cardCollectionReference
        .where('cardNumber', isEqualTo: cardNumber)
        .get()
        .then((querySnapshot) {
      for (var doc in querySnapshot.docs) {
        doc.reference
            .update(data)
            .then((value) => print("Item updated successfully"))
            .catchError((error) => throw ("Failed to update item: $error"));
      }
    });
  }
}
