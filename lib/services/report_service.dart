import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:doctor_appointment_client/data/models/report_model.dart';

class ReportService {
  final CollectionReference _reportCollectionReference =
      FirebaseFirestore.instance.collection('reports');

  Future<void> createReports({required ReportModel reportModel}) async {
    await _reportCollectionReference.add(reportModel.toJson());
  }

  Future<List<ReportModel>> getAllReports({required String userId}) async {
    List<ReportModel> reports = [];

    QuerySnapshot querySnapshot = await _reportCollectionReference
        .where('userId', isEqualTo: userId)
        .get();

    for (var doc in querySnapshot.docs) {
      var report = ReportModel.fromJson(doc.data() as Map<String, dynamic>);
      report.id = doc.id;
      reports.add(report);
    }

    return reports;
  }
}
