import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

final List<Color> color = [
  Colors.red,
  Colors.blue,
  Colors.cyan,
  Colors.green,
  Colors.indigo,
  Colors.orange,
  Colors.purple
];

class ContactCard extends StatelessWidget {
  String name;
  String number;
  String uid;
  String id;
  ContactCard(
      {Key? key,
      required this.name,
      required this.number,
      required this.uid,
      required this.id})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final random = new Random();
    var element = color[random.nextInt(color.length)];
    return  ListTile(
      leading: CircleAvatar(
         child: Text(name[0]),
        backgroundColor: element,
      ),
      title: Text(name),
      subtitle: Text(number),
      trailing: IconButton(
        icon:const Icon(
          Icons.delete,
          color: Colors.red,
        ),
        onPressed: () {
          FirebaseFirestore.instance.collection('contact').doc(id).delete();
        },
      ),
    );
  }
}
