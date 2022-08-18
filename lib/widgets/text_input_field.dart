import 'package:flutter/material.dart';

class TextFieldInput extends StatelessWidget {
  TextEditingController textEditingController;
  String? hintText;
  TextFieldInput({Key? key,required this.textEditingController,required this.hintText}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 15),
      child: TextField(
        decoration: InputDecoration(
            border: OutlineInputBorder(
                borderSide: Divider.createBorderSide(context)),
                hintText: hintText,
                labelText: hintText
                ),
      controller: textEditingController,
      ),

    );
  }
}
