import 'package:contact_app/screens/home_screen.dart';
import 'package:contact_app/screens/login_screen.dart';
import 'package:contact_app/services/auth_methods.dart';
import 'package:contact_app/widgets/snackbar.dart';
import 'package:contact_app/widgets/text_input_field.dart';
import 'package:flutter/material.dart';

class SignupScreen extends StatefulWidget {
  SignupScreen({Key? key}) : super(key: key);

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _usernameController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  bool _isloading = false;

  void signin() async {
    FocusScope.of(context).unfocus();
    setState(() {
      _isloading = true;
    });
    String res = await authMethods().signUpUser(
        _usernameController.text.toString(),
        _emailController.text.toString(),
        _passwordController.text.toString());
    if (res == 'success') {
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => HomeScreen()));
    } else {
      showSnackbar(res, context);
    }
    setState(() {
      _isloading = false;
    });
  }

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _usernameController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Container(
          margin: const EdgeInsets.symmetric(vertical: 24, horizontal: 24),
          child: Column(
            children: [
              TextFieldInput(
                  textEditingController: _usernameController,
                  hintText: 'Enter username'),
              TextFieldInput(
                  textEditingController: _emailController,
                  hintText: 'Enter email'),
              TextFieldInput(
                  textEditingController: _passwordController,
                  hintText: 'Enter password'),
              InkWell(
                onTap: signin,
                child: Container(
                  height: 50,
                  width: double.infinity,
                  decoration: const BoxDecoration(color: Colors.pink),
                  margin: const EdgeInsets.symmetric(vertical: 15),
                  child: Center(
                      child: _isloading
                          ? const Center(
                              child: CircularProgressIndicator(
                                color: Colors.white,
                              ),
                            )
                          : const Text(
                              'Signup',
                              style: TextStyle(
                                  fontSize: 22,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            )),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text("Already have an account? "),
                  TextButton(
                      onPressed: () {
                        Navigator.of(context).pushReplacement(MaterialPageRoute(
                            builder: (context) => LoginScreen()));
                      },
                      child: Text(
                        'Signin',
                        style: TextStyle(color: Colors.pink),
                      ))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
