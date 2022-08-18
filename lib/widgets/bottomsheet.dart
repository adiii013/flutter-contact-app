import 'package:contact_app/services/storage_methods.dart';
import 'package:contact_app/widgets/text_input_field.dart';
import 'package:flutter/material.dart';

showSheet(BuildContext context) {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _numberController = TextEditingController();
  showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (context) {
        return Container(
          margin: EdgeInsets.symmetric(horizontal: 20),
          child: Padding(
              padding: EdgeInsets.only(
                  bottom: MediaQuery.of(context).viewInsets.bottom),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextFieldInput(
                      textEditingController: _nameController,
                      hintText: 'Enter name'),
                  TextFieldInput(
                      textEditingController: _numberController,
                      hintText: 'Enter number'),
                  TextButton(
                      onPressed: () async {
                        Navigator.of(context).pop();
                        await StorageMethods().addNumber(
                            _nameController.text.toString(),
                            _numberController.text.toString(),context);
                      },
                      child: Text(
                        'Submit',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20,color: Colors.pink),
                      )),
                  SizedBox(
                    height: 10,
                  )
                ],
              )),
        );
      });
}
