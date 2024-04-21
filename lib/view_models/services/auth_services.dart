import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dogapp/routes/route_names.dart';
import 'package:dogapp/utils/strings.dart';
import 'package:dogapp/view_models/services/shared_prefence.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:dogapp/models/user_model.dart' as model;
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import '../../models/expert_model.dart' as model_ex;
import 'storage_services.dart';

class AuthMethods {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // get user details
  Future<model.UserModel> getUserDetails() async {
    User currentUser = _auth.currentUser!;

    DocumentSnapshot documentSnapshot =
        await _firestore.collection('users').doc(currentUser.uid).get();

    return model.UserModel.fromSnap(documentSnapshot);
  }

  // Signing Up User
  Future<void> sendVerificationEmail() async {
    User? user = FirebaseAuth.instance.currentUser;
    if (user != null && !user.emailVerified) {
      try {
        await user.sendEmailVerification();
        if (kDebugMode) {
          print('Verification email sent');
        }
      } catch (e) {
        if (kDebugMode) {
          print('Error sending verification email: $e');
        }
        // Handle error sending verification email
      }
    }
  }

  Future<String> signUpUser({
    required String email,
    required String password,
    required String name,
    required String date,
    required String number,
    required String role,
    XFile? file,
  }) async {
    String res = "Some error Occurred";
    try {
      if (email.isNotEmpty &&
          password.isNotEmpty &&
          name.isNotEmpty &&
          date.isNotEmpty &&
          number.isNotEmpty) {
        // registering user in auth with email and password
        UserCredential cred = await _auth.createUserWithEmailAndPassword(
          email: email,
          password: password,
        );
        await sendVerificationEmail();
        String photoUrl = '';
        if (file != null) {
          photoUrl = await StorageMethods()
              .uploadImageToStorage('profilePics', file, false);
        } else {
          photoUrl =
              'https://e7.pngegg.com/pngimages/84/165/png-clipart-united-states-avatar-organization-information-user-avatar-service-computer-wallpaper.png';
        }

        model.UserModel user = model.UserModel(
          name: name,
          id: cred.user!.uid,
          photoUrl: photoUrl,
          email: email,
          password: password,
          date: date,
          phoneNumber: number,
          role: role,
        );

        // adding user in our database
        await _firestore
            .collection("users")
            .doc(cred.user!.uid)
            .set(user.toJson());

        res = "success";
      } else {
        res = "Please enter all the fields";
      }
    } catch (err) {
      return err.toString();
    }
    return res;
  }

  Future<String> signUpExpert({
    required String email,
    required String password,
    required String name,
    required String date,
    required String number,
    required String qualification,
    required String speciality,
    required String role,
    XFile? file,
  }) async {
    String res = "Some error Occurred";
    try {
      if (email.isNotEmpty &&
          password.isNotEmpty &&
          name.isNotEmpty &&
          date.isNotEmpty &&
          number.isNotEmpty &&
          speciality.isNotEmpty) {
        // registering user in auth with email and password
        UserCredential cred = await _auth.createUserWithEmailAndPassword(
          email: email,
          password: password,
        );
        await sendVerificationEmail();
        String photoUrl = '';
        if (file != null) {
          photoUrl = await StorageMethods()
              .uploadImageToStorage('profilePics', file, false);
        } else {
          photoUrl =
              'https://e7.pngegg.com/pngimages/84/165/png-clipart-united-states-avatar-organization-information-user-avatar-service-computer-wallpaper.png';
        }

        model_ex.ExpertModel expert = model_ex.ExpertModel(
          name: name,
          id: cred.user!.uid,
          photoUrl: photoUrl,
          email: email,
          password: password,
          date: date,
          phoneNumber: number,
          role: role,
          qualification: qualification,
          speciality: speciality,
        );

        // adding user in our database
        await _firestore
            .collection("users")
            .doc(cred.user!.uid)
            .set(expert.toJson());

        res = "success";
      } else {
        res = "Please enter all the fields";
      }
    } catch (err) {
      return err.toString();
    }
    return res;
  }

  // logging in user
  Future<String> loginUser({
    required String email,
    required String password,
  }) async {
    String res = "Some error Occurred";
    try {
      if (email.isNotEmpty && password.isNotEmpty) {
        // logging in user with email and password

        UserCredential userCredential = await _auth.signInWithEmailAndPassword(
          email: email,
          password: password,
        );
        if (userCredential.user != null && userCredential.user!.emailVerified) {
          // Email is verified, allow login
          String uid = userCredential.user!.uid;
          SharedPref pref = SharedPref();
          await pref.saveUidToSharedPreferences(uid);
          res = 'success';
        } else {
          // Email is not verified, prompt user to verify email
          res = AppStrings.verifyMail;

          // Optionally, you can also send another verification email here
        }
      } else {
        res = "Please enter all the fields";
      }
    } catch (err) {
      return err.toString();
    }
    return res;
  }

  Future<void> signOut() async {
    SharedPref pref = SharedPref();
    await pref.removeUser();
    await _auth.signOut();
    Get.offAllNamed(RouteName.introPage);
  }

  Future<void> deleteUser() async {
    try {
      User user = _auth.currentUser!;
      model.UserModel userModel = await SharedPref().getUser();
      print(userModel.email);
      print(userModel.password);
      if (userModel.role == 'parent') {
        AuthCredential cred = EmailAuthProvider.credential(
            email: userModel.email!, password: userModel.password!);
        print("this is ${cred.providerId}");
        await user.reauthenticateWithCredential(cred);
        await user.delete();
        debugPrint('User deleted successfully.');
      } else {
        model_ex.ExpertModel expert = await SharedPref().getExpert();
        AuthCredential cred = EmailAuthProvider.credential(
            email: expert.email!, password: expert.password!);
        print("this is $cred");
        await user.reauthenticateWithCredential(cred);
        await user.delete();
        debugPrint('User deleted successfully.');
      }
    } catch (e) {
      debugPrint('Failed to delete user: $e');
    }
  }

  Future<void> isLogin() async {
    User? user = _auth.currentUser;
    if (user == null) {
      // User is signed out
      Get.offNamed(RouteName.introPage);
    } else {
      // User is signed in
      SharedPref pref = SharedPref();
      String? role = await pref.getRoleFromSharedPreferences();
      if (role == 'parent') {
        Get.offNamed(RouteName.parentDashboardPage);
      } else if (role == 'expert') {
        Get.offNamed(RouteName.expertDashboardPage);
      } else {
        Get.offNamed(RouteName.introPage);
      }
    }
  }
}
