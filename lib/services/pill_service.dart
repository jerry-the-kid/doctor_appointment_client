import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:doctor_appointment_client/data/models/pill_model.dart';
import 'package:doctor_appointment_client/services/auth_service.dart';

class PillService {
  final CollectionReference _pillCollectionReference =
      FirebaseFirestore.instance.collection('pills');

  Future<void> createPill({required PillModel pillModel}) async {
    await _pillCollectionReference.add(pillModel.toJson());
  }

  Future<void> addPillsInBatch(List<PillModel> pills) async {
    // Start a new batch
    WriteBatch batch = FirebaseFirestore.instance.batch();

    // Add each pill to the batch
    for (var pill in pills) {
      batch.set(_pillCollectionReference.doc(), pill.toJson());
    }

    // Commit the batch
    await batch.commit();
  }

  Future<List<PillModel>> getPillsForDay(DateTime day) async {
    QuerySnapshot querySnapshot = await _pillCollectionReference
        .where("userId", isEqualTo: Auth().currentUser!.uid)
        .get();

    List<PillModel> pills = [];
    for (var doc in querySnapshot.docs) {
      pills.add(PillModel.fromJson(doc.data() as Map<String, dynamic>));
    }
    return pills;
  }

  // Future<PrescriptionModel?> getPrescription(
  //     {required String prescriptionId}) async {
  //   DocumentSnapshot documentSnapshot =
  //       await _prescriptionCollectionReference.doc(prescriptionId).get();

  //   if (documentSnapshot.exists) {
  //     Map<String, dynamic> prescriptionData =
  //         documentSnapshot.data() as Map<String, dynamic>;
  //     PrescriptionModel prescription =
  //         PrescriptionModel.fromJson(prescriptionData);
  //     prescription.id = documentSnapshot.id;
  //     return prescription;
  //   } else {
  //     return null;
  //   }
  // }

  // Future<List<PrescriptionModel>> getAllPrescription(
  //     {required String userId}) async {
  //   List<PrescriptionModel> prescriptions = [];

  //   QuerySnapshot querySnapshot = await _prescriptionCollectionReference
  //       .where('userId', isEqualTo: userId)
  //       .get();

  //   for (var doc in querySnapshot.docs) {
  //     var prescription =
  //         PrescriptionModel.fromJson(doc.data() as Map<String, dynamic>);
  //     prescription.id = doc.id;
  //     prescriptions.add(prescription);
  //   }

  //   return prescriptions;
  // }
}
