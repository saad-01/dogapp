import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
final String? id;
final String? email;
final String? photoUrl;
final String? date;
final String? phoneNumber;
final String? name;
final String? role;
UserModel({this.photoUrl, this.date, this.phoneNumber, this.name, this.id, this.email,this.role});
static UserModel fromSnap(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;

    return UserModel(
      name: snapshot["name"],
      id: snapshot["id"],
      email: snapshot["email"],
      photoUrl: snapshot["photoUrl"],
      phoneNumber: snapshot["phoneNumber"],
      date: snapshot["date"],
      role: snapshot["role"],
    );
  }

  Map<String, dynamic> toJson() => {
        "name": name,
        "uid": id,
        "email": email,
        "photoUrl": photoUrl,
        "phoneNumber": phoneNumber,
        "date": date,
        "role":role
      };
}