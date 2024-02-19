import 'package:doctor_appointment_client/data/models/card_model.dart';
import 'package:doctor_appointment_client/data/models/user_model.dart';
import 'package:flutter/material.dart';

class UserProvider extends ChangeNotifier {
  UserModel? currentUser;

  UserProvider({CardModel? currentUser});

  void setCurrentUser({required UserModel user}) {
    currentUser = user;
    notifyListeners();
  }

  void updateCardList({required List<CardModel> updatedCards}) {
    if (currentUser == null) return;

    currentUser!.cards = [...(currentUser!.cards ?? []), ...updatedCards];
    notifyListeners();
  }
}
