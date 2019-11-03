import 'package:cloud_firestore/cloud_firestore.dart';

class Sessions {
  final String documentId;
  String title;
  String description;
  String date;
  String timeFrom;
  String timeTo;
  String imgUrl;
  String registrationLink;

  Sessions({
    this.documentId,
    this.title,
    this.description,
    this.date,
    this.timeFrom,
    this.timeTo,
    this.imgUrl,
    this.registrationLink,
  });

  factory Sessions.fromFirestore(DocumentSnapshot doc) {
    Map data = doc.data;
    return Sessions(
        documentId: doc.documentID,
        title: data['title'],
        description: data['description'],
        date: data['date'],
        timeFrom: data['timeFrom'],
        timeTo: data['timeTo'],
        imgUrl: data['imgUrl'],
        registrationLink: data['registrationLink'] ?? '');
  }
  toJson() {
    return {
      'title': title,
      'description': description,
      'date': date,
      'timeFrom': timeFrom,
      'timeTo': timeTo,
      'imgUrl': imgUrl,
      'registrationLink': registrationLink,
    };
  }
}
