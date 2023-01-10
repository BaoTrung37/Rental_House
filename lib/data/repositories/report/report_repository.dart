import 'package:batru_house_rental/data/models/report/report_response.dart';
import 'package:batru_house_rental/domain/entities/report/report_entity.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ReportRepository {
  final _fireStore = FirebaseFirestore.instance;

  Future<void> addReport(ReportResponse reportResponse) async {
    await _fireStore
        .collection('report')
        .doc(reportResponse.id)
        .set(reportResponse.toJson());
  }

  Future<ReportEntity> getReportById(String id) async {
    final doc = await _fireStore.collection('report').doc(id).get();
    return ReportResponse.fromJson(doc.data()!).toEntity();
  }

  Future<List<ReportEntity>> getAllReport() async {
    final snapshot = await _fireStore
        .collection('report')
        .orderBy('id', descending: true)
        .get();
    return snapshot.docs
        .map((doc) => ReportResponse.fromJson(doc.data()).toEntity())
        .toList();
  }

  Future<void> deleteReport(String id) async {
    await _fireStore.collection('report').doc(id).delete();
  }

  Future<void> updateReport(ReportResponse reportResponse) async {
    await _fireStore
        .collection('report')
        .doc(reportResponse.id)
        .update(reportResponse.toJson());
  }
}
