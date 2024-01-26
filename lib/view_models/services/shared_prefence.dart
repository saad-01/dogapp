import 'package:dogapp/models/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPref {
  Future<void> saveUidToSharedPreferences(String uid) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('userUid', uid);
  }

  Future<bool> saveUser(UserModel responseModel) async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    sp.setString('name', responseModel.name.toString());
    sp.setString('email', responseModel.email.toString());
    sp.setString('uid', responseModel.id.toString());
    sp.setString('role', responseModel.role.toString());
    sp.setString('photoUrl', responseModel.photoUrl.toString());
    sp.setString('phoneNumber', responseModel.phoneNumber.toString());
    sp.setString('date', responseModel.date.toString());

    return true;
  }

// Example of retrieving the UID from shared preferences
  Future<String?> getUidFromSharedPreferences() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('userUid');
  }

  Future<String?> getNameFromSharedPreferences() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('name');
  }

  Future<String?> getRoleFromSharedPreferences() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('role');
  }
  Future<bool> removeUser() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    sp.clear();
    return true;
  }
}
