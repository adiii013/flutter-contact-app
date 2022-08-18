import 'package:flutter/material.dart';

class Contact {
  String name;
  String number;
  String uid;
  String id;
  Contact({required this.name, required this.number, required this.uid,required this.id});

  Map<String, dynamic> toJson() => {'name': name, 'number': number, 'uid': uid,'id':id};
}
