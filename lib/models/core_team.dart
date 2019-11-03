import 'package:cloud_firestore/cloud_firestore.dart';

class CoreTeam {
  final String documentId;
  String name;
  String desciption;
  String imgUrl;
  String twitter;
  String linkedin;
  String github;
  String facebook;

  CoreTeam({
    this.documentId,
    this.name,
    this.desciption,
    this.imgUrl,
    this.facebook,
    this.github,
    this.linkedin,
    this.twitter,
  });

  factory CoreTeam.fromFireStore(DocumentSnapshot doc) {
    Map data = doc.data;
    return CoreTeam(
        documentId: doc.documentID,
        name: data['name'],
        desciption: data['description'],
        imgUrl: data['imgUrl'],
        facebook: data['facebook'],
        twitter: data['twitter'],
        github: data['github'],
        linkedin: data['linkedin']);
  }
  toJson() => {
        'name': name,
        'description': desciption,
        'imgUrl': imgUrl,
        'facebook': facebook,
        'twitter': twitter,
        'github': github,
        'linkedin': linkedin,
      };
}
