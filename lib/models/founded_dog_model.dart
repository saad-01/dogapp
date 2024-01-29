import 'package:cloud_firestore/cloud_firestore.dart';

class FoundedDogModel {
  final String? dogId;
  final String? uid;
  final String? photoUrl;
  final String? foundDate;
  final String? microchipNumber;
  final String? yourName;
  final String? address;
  final String? phoneNum;
  final String? notes;
  final String? colors;
  final String? urls;
  final String? gender;
  FoundedDogModel({
    this.dogId,
    this.uid,
    this.photoUrl,
    this.foundDate,
    this.microchipNumber,
    this.colors,
    this.gender,
    this.yourName,
    this.address,
    this.phoneNum,
    this.notes,
    this.urls,
  });
  static FoundedDogModel fromSnap(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;

    return FoundedDogModel(
      uid: snapshot["uid"],
      dogId: snapshot["dogId"],
      photoUrl: snapshot["photoUrl"],
      microchipNumber: snapshot["microchipNumber"],
      foundDate: snapshot["foundDate"],
      gender: snapshot["gender"],
      colors: snapshot["colors"],
      urls: snapshot["urls"],
      yourName: snapshot["parentName"],
      address: snapshot["address"],
      phoneNum: snapshot["phoneNumber"],
    );
  }

  Map<String, dynamic> toJson() => {
        "uid": uid,
        "dogId": dogId,
        "photoUrl": photoUrl,
        "microchipNumber": microchipNumber,
        "foundDate": foundDate,
        "gender": gender,
        "colors": colors,
        "urls": urls,
        "yourName": yourName,
        "address": address,
        "phoneNum": phoneNum,
      };
}
