import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:doctor_appointment_client/data/models/prescription_model.dart';

class PrescriptionService {
  final CollectionReference _prescriptionCollectionReference =
      FirebaseFirestore.instance.collection('prescriptions');

  Future<void> createPrescription(
      {required PrescriptionModel prescriptionModel}) async {
    await _prescriptionCollectionReference.add(prescriptionModel.toJson());
  }

  Future<PrescriptionModel?> getPrescription(
      {required String prescriptionId}) async {
    DocumentSnapshot documentSnapshot =
        await _prescriptionCollectionReference.doc(prescriptionId).get();

    if (documentSnapshot.exists) {
      Map<String, dynamic> prescriptionData =
          documentSnapshot.data() as Map<String, dynamic>;
      PrescriptionModel prescription =
          PrescriptionModel.fromJson(prescriptionData);
      prescription.id = documentSnapshot.id;
      return prescription;
    } else {
      return null;
    }
  }

  Future<List<PrescriptionModel>> getAllPrescription(
      {required String userId}) async {
    List<PrescriptionModel> prescriptions = [];

    QuerySnapshot querySnapshot = await _prescriptionCollectionReference
        .where('userId', isEqualTo: userId)
        .get();

    for (var doc in querySnapshot.docs) {
      var prescription =
          PrescriptionModel.fromJson(doc.data() as Map<String, dynamic>);
      prescription.id = doc.id;
      prescriptions.add(prescription);
    }

    return prescriptions;
  }
}
