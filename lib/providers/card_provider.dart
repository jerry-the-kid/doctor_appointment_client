import 'package:doctor_appointment_client/data/models/card_model.dart';
import 'package:flutter/material.dart';

class CardProvider extends ChangeNotifier {
  CardModel? selectedCard;

  CardProvider({CardModel? selectedCard});

  void setSelectedCard({required CardModel selectedCard}) {
    this.selectedCard = selectedCard;
  }
}
