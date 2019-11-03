import 'package:cloud_firestore/cloud_firestore.dart';

class CoreTeam {
  final String documentId;
  String name;
  String desciption;
  String imgUrl;

  CoreTeam({this.documentId, this.name, this.desciption, this.imgUrl});

  factory CoreTeam.fromFireStore(DocumentSnapshot doc) {
    Map data = doc.data;
    return CoreTeam(
      documentId: doc.documentID,
      name: data['name'],
      desciption: data['description'],
      imgUrl: data['imgUrl'],
    );
  }
  toJson() => {
        'name': name,
        'description': desciption,
        'imgUrl': imgUrl,
      };
}
