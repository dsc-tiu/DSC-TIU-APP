import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dsc_tiu/models/sessions_model.dart';

class DataService {
  final Firestore _db = Firestore.instance;
  Stream<List<SessionsModel>> streamSessions() {
    var ref = _db.collection('sessions');
    return ref.snapshots().map((list) =>
        list.documents.map((doc) => SessionsModel.fromFirestore(doc)).toList());
  }
}
