import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dogapp/routes/route_names.dart';
import 'package:dogapp/utils/strings.dart';
import 'package:dogapp/utils/utils.dart';
import 'package:dogapp/view_models/services/shared_prefence.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:dogapp/models/user_model.dart' as model;
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:image_picker/image_picker.dart';
import 'package:uuid/uuid.dart';
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

  Future<String> googleSignIn() async {
    String res = "Some error occurred";
    final GoogleSignIn googleSignIn = GoogleSignIn();
    final GoogleSignInAccount? googleSignInAccount =
        await googleSignIn.signIn();

    if (googleSignInAccount != null) {
      final GoogleSignInAuthentication googleSignInAuthentication =
          await googleSignInAccount.authentication;

      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleSignInAuthentication.accessToken,
        idToken: googleSignInAuthentication.idToken,
      );

      try {
        final UserCredential userCredential =
            await FirebaseAuth.instance.signInWithCredential(credential);

        if (userCredential.user != null &&
            userCredential.additionalUserInfo?.isNewUser == true) {
          // The user is signing in for the first time, so we treat this as a sign-up
          String uid = userCredential.user!.uid;
          SharedPref pref = SharedPref();
          await pref.saveUidToSharedPreferences(uid);
          res = 'success';
          Get.off(RouteName.chooseProfilePage);
        } else if (userCredential.user != null &&
            userCredential.user!.emailVerified) {
          // Email is verified, allow login
          String uid = userCredential.user!.uid;
          SharedPref pref = SharedPref();
          await pref.saveUidToSharedPreferences(uid);
          res = 'success';
        } else {
          // Email is not verified, prompt user to verify email
          res = 'Please verify your email to continue.';
          // Optionally, you can also send another verification email here
          await userCredential.user?.sendEmailVerification();
        }
      } on FirebaseAuthException catch (e) {
        if (e.code == 'account-exists-with-different-credential') {
          res = 'Account exists with a different credential.';
        } else if (e.code == 'invalid-credential') {
          res = 'Invalid credential. Please try again.';
        } else {
          res = 'Error: ${e.message}';
        }
      } catch (e) {
        res = e.toString();
      }
    }

    return res;
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

  Future<void> sendPasswordResetEmail(String email) async {
    User? user = FirebaseAuth.instance.currentUser;
    if (user != null && !user.emailVerified) {
      try {
        await _auth.sendPasswordResetEmail(email: email);

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
    // print("this is $email");
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

  Future<String> updateUser({
    required String email,
    required String password,
    required String name,
    required String date,
    required String number,
    required String role,
    required String uid,
    XFile? file,
  }) async {
    String res = "Some error Occurred";
    try {
      if (email.isNotEmpty &&
          password.isNotEmpty &&
          name.isNotEmpty &&
          date.isNotEmpty &&
          number.isNotEmpty) {
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
          id: uid,
          photoUrl: photoUrl,
          email: email,
          password: password,
          date: date,
          phoneNumber: number,
          role: role,
        );
        await SharedPref().saveUser(user);
        // adding user in our database
        await _firestore.collection("users").doc(uid).update(user.toJson());

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

  Future<String> addExpert({
    required String name,
    required String number,
    required String qualification,
    required String speciality,
    required String role,
    required String id,
    XFile? file,
  }) async {
    String res = "Some error Occurred";
    try {
      if (name.isNotEmpty && number.isNotEmpty && speciality.isNotEmpty) {
        String photoUrl = '';
        photoUrl =
            'https://e7.pngegg.com/pngimages/84/165/png-clipart-united-states-avatar-organization-information-user-avatar-service-computer-wallpaper.png';

        model_ex.ExpertModel expert = model_ex.ExpertModel(
          name: name,
          id: id,
          photoUrl: photoUrl,
          phoneNumber: number,
          role: role,
          qualification: qualification,
          speciality: speciality,
        );

        // adding user in our database
        await _firestore.collection("users").doc(id).set(expert.toJson());

        res = "success";
      } else {
        res = "Please enter all the fields";
      }
    } catch (err) {
      return err.toString();
    }
    return res;
  }

  static String couponId = '';
  static Future<void> couponValidate(
      String expertId, String parentId, String code) async {
    final lastCouponSnapshot = await FirebaseFirestore.instance
        .collection('coupons')
        .where('expertId', isEqualTo: expertId)
        .where('parentId', isEqualTo: parentId)
        .where('status', isEqualTo: "Active")
        .get();

    if (lastCouponSnapshot.docs.isNotEmpty) {
      couponId = lastCouponSnapshot.docs.first['uid'];
      print("This is $couponId");
      Utils.snackBar(AppStrings.success.tr, "Applied");
    } else {
      Utils.snackBar(AppStrings.error.tr, "Invalid Coupon");
    }
  }

  static Future<void> couponUsed() async {
    print("This is $couponId");
    await FirebaseFirestore.instance
        .collection('coupons')
        .where('uid', isEqualTo: couponId)
        .where('status', isEqualTo: "Active")
        .get()
        .then((value) {
      if (value.docs.isNotEmpty) {
        FirebaseFirestore.instance.collection('coupons').doc(couponId).update({
          'status': 'Used',
        });
      }
      // couponId = '';
    });
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
      Get.offNamed(RouteName.languagePage);
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
