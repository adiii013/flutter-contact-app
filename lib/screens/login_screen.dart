import 'package:contact_app/screens/home_screen.dart';
import 'package:contact_app/screens/signup_screen.dart';
import 'package:contact_app/services/auth_methods.dart';
import 'package:contact_app/widgets/snackbar.dart';
import 'package:contact_app/widgets/text_input_field.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  bool _isloading = false;
  void logInUser() async {
    setState(() {
      _isloading = true;
    });
    FocusScope.of(context).unfocus();
    String res = await authMethods().signinUser(
        _emailController.text.toString(), _passwordController.text.toString());

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
    // TODO: implement dispose
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
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
                  textEditingController: _emailController,
                  hintText: 'Enter email'),
              TextFieldInput(
                  textEditingController: _passwordController,
                  hintText: 'Enter password'),
              InkWell(
                onTap: logInUser,
                child: Container(
                  height: 50,
                  width: double.infinity,
                  decoration: const BoxDecoration(color: Colors.pink),
                  margin: const EdgeInsets.symmetric(vertical: 15),
                  child: _isloading ?const Center(child: CircularProgressIndicator(color: Colors.white),) : const Center(
                      child: Text(
                    'Login',
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
                  Text("Doesn't have an account? "),
                  TextButton(
                      onPressed: () {
                        Navigator.of(context).pushReplacement(MaterialPageRoute(
                            builder: (context) => SignupScreen()));
                      },
                      child: Text(
                        'Signup',
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
