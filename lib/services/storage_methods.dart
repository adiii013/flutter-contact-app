
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:contact_app/model/contact.dart';
import 'package:contact_app/widgets/snackbar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:uuid/uuid.dart';

class StorageMethods {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> addNumber(String name, String number,BuildContext context) async {
    try {
      String uniqueId = Uuid().v1();
      Contact _contact = Contact(
          name: name,
          number: number,
          id: uniqueId,
          uid: FirebaseAuth.instance.currentUser!.uid);
      if (name.isNotEmpty & number.isNotEmpty) {
        await _firestore
            .collection('contact')
            .doc(uniqueId)
            .set(_contact.toJson());
      } else {
        showSnackbar("Complete Fields then submit", context);
      }
    } catch (e) {
      print(e.toString());
    }
  }
}
