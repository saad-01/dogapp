import 'package:cloud_firestore/cloud_firestore.dart';

class MissingDogModel {
  final String? dogId;
  final String? uid;
  final String? weight;
  final String? photoUrl;
  final String? lostDate;
  final String? microchipNumber;
  final String? name;
  final String? yourName;
  final String? address;
  final String? phoneNum;
  final String? notes;
  final String? age;
  final String? breed;
  final String? colors;
  final String? urls;
  final String? gender;
  MissingDogModel({
    this.dogId,
    this.uid,
    this.weight,
    this.photoUrl,
    this.lostDate,
    this.microchipNumber,
    this.name,
    this.breed,
    this.colors,
    this.gender,
    this.yourName,
    this.address,
    this.phoneNum,
    this.notes,
    this.age,
    this.urls,
  });
  static MissingDogModel fromSnap(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;

    return MissingDogModel(
      name: snapshot["name"],
      uid: snapshot["uid"],
      dogId: snapshot["dogId"],
      photoUrl: snapshot["photoUrl"],
      microchipNumber: snapshot["microchipNumber"],
      lostDate: snapshot["lostDate"],
      weight: snapshot["weight"],
      breed: snapshot["breed"],
      gender: snapshot["gender"],
      colors: snapshot["colors"],
      urls: snapshot["urls"],
      yourName: snapshot["parentName"],
      address: snapshot["address"],
      phoneNum: snapshot["phoneNumber"],
      age: snapshot["age"],
    );
  }

  Map<String, dynamic> toJson() => {
        "name": name,
        "uid": uid,
        "dogId": dogId,
        "photoUrl": photoUrl,
        "microchipNumber": microchipNumber,
        "lostDate": lostDate,
        "weight": weight,
        "breed": breed,
        "gender": gender,
        "colors": colors,
        "urls": urls,
        "yourName": yourName,
        "address": address,
        "phoneNum": phoneNum,
        "age": age,
      };
}
