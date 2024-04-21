import 'package:dogapp/models/expert_model.dart';
import 'package:dogapp/models/user_model.dart';
import 'package:dogapp/view_models/services/localization.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPref {
  Future<void> saveUidToSharedPreferences(String uid) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('userUid', uid);
  }

  Future<void> setLang(String lang) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('locale', lang);
  }

  Future<void> getLang() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? lang = prefs.getString('locale');
    AppTranslation.changeLocale(lang!);
  }

  Future<bool> saveUser(UserModel responseModel) async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    sp.setString('name', responseModel.name.toString());
    sp.setString('email', responseModel.email.toString());
    sp.setString('password', responseModel.password.toString());
    sp.setString('uid', responseModel.id.toString());
    sp.setString('role', responseModel.role.toString());
    sp.setString('photoUrl', responseModel.photoUrl.toString());
    sp.setString('phoneNumber', responseModel.phoneNumber.toString());
    sp.setString('date', responseModel.date.toString());

    return true;
  }

  Future<UserModel> getUser() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    String? email = sp.getString('email');
    String? password = sp.getString('password');
    String? name = sp.getString('name');
    String? role = sp.getString('role');
    String? date = sp.getString('date');
    String? phoneNumber = sp.getString('phoneNumber');
    String? photoUrl = sp.getString('photoUrl');

    return UserModel(
        name: name,
        email: email,
        password: password,
        phoneNumber: phoneNumber,
        date: date,
        role: role,
        photoUrl: photoUrl);
  }

  Future<bool> saveExpert(ExpertModel responseModel) async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    sp.setString('name', responseModel.name.toString());
    sp.setString('email', responseModel.email.toString());
    sp.setString('password', responseModel.password.toString());
    sp.setString('uid', responseModel.id.toString());
    sp.setString('role', responseModel.role.toString());
    sp.setString('photoUrl', responseModel.photoUrl.toString());
    sp.setString('phoneNumber', responseModel.phoneNumber.toString());
    sp.setString('date', responseModel.date.toString());
    sp.setString('qualification', responseModel.date.toString());
    sp.setString('speciality', responseModel.date.toString());

    return true;
  }

  Future<ExpertModel> getExpert() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    String? email = sp.getString('email');
    String? password = sp.getString('password');
    String? name = sp.getString('name');
    String? role = sp.getString('role');
    String? date = sp.getString('date');
    String? phoneNumber = sp.getString('phoneNumber');
    String? photoUrl = sp.getString('photoUrl');
    String? speciality = sp.getString('speciality');
    String? qualification = sp.getString('qualification');

    return ExpertModel(
        name: name,
        email: email,
        password: password,
        phoneNumber: phoneNumber,
        date: date,
        role: role,
        qualification: qualification,
        speciality: speciality,
        photoUrl: photoUrl);
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
