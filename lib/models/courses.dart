import 'package:cloud_firestore/cloud_firestore.dart';

class Courses {
  final String documentId;
  String title;
  String description;
  String dateFrom;
  String dateTo;
  String imgUrl;
  String registrationLink;

  Courses({
    this.documentId,
    this.title,
    this.description,
    this.dateFrom,
    this.dateTo,
    this.imgUrl,
    this.registrationLink,
  });

  factory Courses.fromFirestore(DocumentSnapshot doc) {
    Map data = doc.data;
    return Courses(
        documentId: doc.documentID,
        title: data['title'],
        description: data['description'],
        dateFrom: data['dateFrom'],
        dateTo: data['dateTo'],
        imgUrl: data['imgUrl'],
        registrationLink: data['registrationLink'] ?? '');
  }
  toJson() {
    return {
      'title': title,
      'description': description,
      'dateFrom': dateFrom,
      'dateTo': dateTo,
      'imgUrl': imgUrl,
      'registrationLink': registrationLink,
    };
  }
}
