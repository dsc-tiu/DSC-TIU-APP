import 'package:cloud_firestore/cloud_firestore.dart';

class SessionsModel {
  final String title;
  final String description;
  final String date;
  final String timeFrom;
  final String timeTo;
  final String imgUrl;
  final String registrationLink;

  SessionsModel({
    this.title,
    this.description,
    this.date,
    this.timeFrom,
    this.timeTo,
    this.imgUrl,
    this.registrationLink,
  });

  factory SessionsModel.fromFirestore(DocumentSnapshot doc) {
    Map data = doc.data;
    return SessionsModel(
        title: data['title'],
        description: data['description'],
        date: data['date'],
        timeFrom: data['timeFrom'],
        timeTo: data['timeTo'],
        imgUrl: data['imgUrl'],
        registrationLink: data['registrationLink'] ?? '');
  }
}
