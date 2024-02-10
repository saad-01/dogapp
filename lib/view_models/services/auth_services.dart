import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dogapp/routes/route_names.dart';
import 'package:dogapp/view_models/services/shared_prefence.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:dogapp/models/user_model.dart' as model;
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import '../../models/user_model.dart';
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
        String photoUrl='';
        if (file!=null) {
          photoUrl = await StorageMethods()
            .uploadImageToStorage('profilePics', file, false);
        } else {
          photoUrl ='https://e7.pngegg.com/pngimages/84/165/png-clipart-united-states-avatar-organization-information-user-avatar-service-computer-wallpaper.png';
        }
        

        model.UserModel user = model.UserModel(
          name: name,
          id: cred.user!.uid,
          photoUrl: photoUrl,
          email: email,
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

  // logging in user
  Future<String> loginUser({
    required String email,
    required String password,
  }) async {
    String res = "Some error Occurred";
    try {
      if (email.isNotEmpty || password.isNotEmpty) {
        // logging in user with email and password

        UserCredential userCredential = await _auth.signInWithEmailAndPassword(
          email: email,
          password: password,
        );

        // Access the user's UID
        String uid = userCredential.user!.uid;
        var userSnap =
            await FirebaseFirestore.instance.collection('users').doc(uid).get();
        var userData = {};
        userData = userSnap.data()!;
        var role = userData['role'];
        UserModel user = model.UserModel(
            photoUrl: userData['photoUrl'],
            date: userData['date'],
            role: userData['role'],
            phoneNumber: userData['phoneNumber'],
            name: userData['name'],
            id: userData['uid'],
            email: userData['email']);
        SharedPref pref = SharedPref();
        await pref.saveUidToSharedPreferences(uid);
        await pref.saveUser(user);
        if (role == 'parent') {
          Get.offAllNamed(RouteName.parentDashboardPage);
        } else {
          Get.offAll(RouteName.expertDashboardPage);
        }
        res = "success";
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
    Get.offAllNamed(RouteName.loginPage);
  }

  Future<void> isLogin() async {
    _auth.authStateChanges().listen((User? user) async {
      if (user == null) {
        // User is signed out
        Get.offNamed(RouteName.introPage);
      } else {
        // User is signed in
        SharedPref pref = SharedPref();
        String? role = await pref.getRoleFromSharedPreferences();
        if (role == 'parent') {
          Get.offNamed(RouteName.parentDashboardPage);
        } else {
          Get.offNamed(RouteName.expertDashboardPage);
        }
      }
    });
  }
}
