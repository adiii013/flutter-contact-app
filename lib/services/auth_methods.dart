import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:contact_app/model/user.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

class authMethods {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  //Signup User

  Future<String> signUpUser(
      String username, String email, String password) async {
    String res = "Some error occured";

    try {
      UserCredential user = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);

      UserData _user =
          UserData(username: username, email: email, uid: user.user!.uid);
      await _firestore
          .collection('users')
          .doc(user.user!.uid)
          .set(_user.toJson());

      res = "success";
    } catch (e) {
      res = e.toString();
    }
    return res;
  }

  //Sign in User

  Future<String> signinUser(String email, String password) async {
    String res = 'Some error occured';

    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      res = "success";
    } catch (e) {
      res = e.toString();
    }
    return res;
  }
}
