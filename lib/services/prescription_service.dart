import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:doctor_appointment_client/data/models/prescription_model.dart';

class PrescriptionService {
  final CollectionReference _prescriptionCollectionReference =
      FirebaseFirestore.instance.collection('prescriptions');

  Future<void> createPrescription(
      {required PrescriptionModel prescriptionModel}) async {
    await _prescriptionCollectionReference.add(prescriptionModel.toJson());
  }
}
