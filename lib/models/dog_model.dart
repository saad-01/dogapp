import 'package:cloud_firestore/cloud_firestore.dart';

class DogModel {
  final String? dogId;
  final String? uid;
  final String? weight;
  final String? photoUrl;
  final String? date;
  final String? microchipNumber;
  final String? name;
  final String? breed;
  final String? neutered;
  final String? colors;
  final String? gender;
  DogModel(
      {this.dogId,
      this.uid,
      this.weight,
      this.photoUrl,
      this.date,
      this.microchipNumber,
      this.name,
      this.breed,
      this.neutered,
      this.colors,
      this.gender});
  static DogModel fromSnap(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;

    return DogModel(
        name: snapshot["name"],
        uid: snapshot["uid"],
        dogId: snapshot["dogId"],
        photoUrl: snapshot["photoUrl"],
        microchipNumber: snapshot["microchipNumber"],
        date: snapshot["date"],
        weight: snapshot["weight"],
        breed: snapshot["breed"],
        gender: snapshot["gender"],
        neutered: snapshot["neutered"],
        colors: snapshot["colors"]);
  }

  Map<String, dynamic> toJson() => {
        "name": name,
        "uid": uid,
        "dogId": dogId,
        "photoUrl": photoUrl,
        "microchipNumber": microchipNumber,
        "date": date,
        "weight": weight,
        "breed": breed,
        "gender": gender,
        "neutered": neutered,
        "colors": colors
      };
}
