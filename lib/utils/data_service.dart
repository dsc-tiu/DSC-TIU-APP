import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dsc_tiu/models/core_team.dart';
import 'package:dsc_tiu/models/courses.dart';
import 'package:dsc_tiu/models/sessions.dart';
import 'package:flutter/foundation.dart';

class DataService {
  final Firestore _db = Firestore.instance;
  final String _sessionRef = 'sessions';
  final String _courseRef = 'courses';
  final String _coreTeamRef = 'coreTeam';

  Stream<List<Sessions>> streamSessions() {
    var ref = _db.collection(_sessionRef);
    return ref.snapshots().map((list) =>
        list.documents.map((doc) => Sessions.fromFirestore(doc)).toList());
  }

  Future<void> addSession({@required Sessions session}) =>
      _db.collection(_sessionRef).document().setData(session.toJson());

  Future<void> updateSession({@required Sessions session}) => _db
      .collection(_sessionRef)
      .document(session.documentId)
      .updateData(session.toJson());

  Future<void> deleteSession({@required Sessions session}) =>
      _db.collection(_sessionRef).document(session.documentId).delete();

  Stream<List<Courses>> streamCourses() {
    var ref = _db.collection(_courseRef);
    return ref.snapshots().map((list) =>
        list.documents.map((doc) => Courses.fromFirestore(doc)).toList());
  }

  Future<void> addCourse({@required Courses course}) =>
      _db.collection(_courseRef).document().setData(course.toJson());

  Future<void> updateCourse({@required Courses course}) => _db
      .collection(_courseRef)
      .document(course.documentId)
      .updateData(course.toJson());

  Future<void> deleteCourse({@required Courses course}) =>
      _db.collection(_courseRef).document(course.documentId).delete();

  Stream<List<Courses>> streamCoreTeam() {
    var ref = _db.collection(_coreTeamRef);
    return ref.snapshots().map((list) =>
        list.documents.map((doc) => Courses.fromFirestore(doc)).toList());
  }

  Future<void> addCoreTeam({@required CoreTeam coreTeam}) =>
      _db.collection(_coreTeamRef).document().setData(coreTeam.toJson());

  Future<void> updateCoreTeam({@required CoreTeam coreTeam}) => _db
      .collection(_coreTeamRef)
      .document(coreTeam.documentId)
      .updateData(coreTeam.toJson());

  Future<void> deleteCoreTeam({@required CoreTeam coreTeam}) =>
      _db.collection(_coreTeamRef).document(coreTeam.documentId).delete();
}
