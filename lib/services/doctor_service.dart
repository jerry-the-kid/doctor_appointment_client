import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:doctor_appointment_client/data/models/doctor_model.dart';

class DoctorService {
  final CollectionReference _doctorCollectionReference =
      FirebaseFirestore.instance.collection('doctors');

  Future<void> createDoctor({required DoctorModel doctorModel}) async {
    await _doctorCollectionReference.add(doctorModel.toJson());
  }

  Future<DoctorModel?> getDoctor({required String uid}) async {
    DocumentSnapshot documentSnapshot =
        await _doctorCollectionReference.doc(uid).get();

    if (documentSnapshot.exists) {
      Map<String, dynamic> doctorData =
          documentSnapshot.data() as Map<String, dynamic>;
      DoctorModel doctor = DoctorModel.fromJson(doctorData);
      doctor.id = documentSnapshot.id;
      return doctor;
    } else {
      return null;
    }
  }

  Future<List<DoctorModel>> getDoctorsBySpecialist(
      {required String specialistIn}) async {
    QuerySnapshot querySnapshot = await _doctorCollectionReference
        .where('specialistIn', isEqualTo: specialistIn)
        .get();

    List<DoctorModel> doctors = [];

    for (var doc in querySnapshot.docs) {
      Map<String, dynamic> doctorData = doc.data() as Map<String, dynamic>;
      DoctorModel doctor = DoctorModel.fromJson(doctorData);
      doctor.id = doc.id;
      doctors.add(doctor);
    }

    return doctors;
  }

  Future<void> updateDoctor(
      {required String uid, required Map<Object, Object?> data}) async {
    await _doctorCollectionReference.doc(uid).update(data);
  }

  Future<List<DoctorModel>> getAllDoctors() async {
    QuerySnapshot querySnapshot = await _doctorCollectionReference.get();
    List<DoctorModel> doctors = [];

    for (var doc in querySnapshot.docs) {
      Map<String, dynamic> doctorData = doc.data() as Map<String, dynamic>;
      DoctorModel doctor = DoctorModel.fromJson(doctorData);
      doctor.id = doc.id;
      doctors.add(doctor);
    }

    return doctors;
  }
}
