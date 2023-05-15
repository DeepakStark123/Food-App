// ignore_for_file: prefer_final_fields

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:food_app/modules/auth/auth_controller/auth_controller.dart';
import 'package:food_app/utils/common_utils.dart/common_utils.dart';
import '../../../widgets/round_button.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController _emailConroller = TextEditingController();
  TextEditingController _passwordConroller = TextEditingController();
  FocusNode _emailFocusNode = FocusNode();
  FocusNode _passFocusNode = FocusNode();
  ValueNotifier<bool> obscurePassword = ValueNotifier<bool>(false);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height * 1;
    final authController = Provider.of<AuthController>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text("SignUp page"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          TextFormField(
            controller: _emailConroller,
            focusNode: _emailFocusNode,
            onFieldSubmitted: (val) {
              CommonUtils.getFocusNode(
                  context, _emailFocusNode, _passFocusNode);
            },
            keyboardType: TextInputType.emailAddress,
            decoration: const InputDecoration(
                hintText: "Enter Email",
                labelText: "Email",
                prefixIcon: Icon(Icons.email)),
          ),
          ValueListenableBuilder(
            valueListenable: obscurePassword,
            builder: (context, value, child) {
              return TextFormField(
                obscureText: obscurePassword.value,
                obscuringCharacter: '*',
                controller: _passwordConroller,
                focusNode: _passFocusNode,
                decoration: InputDecoration(
                  hintText: "Enter password",
                  labelText: "password",
                  prefixIcon: const Icon(Icons.lock_clock_outlined),
                  suffixIcon: IconButton(
                    onPressed: () {
                      obscurePassword.value = !obscurePassword.value;
                    },
                    icon: Icon(obscurePassword.value
                        ? Icons.visibility_off_outlined
                        : Icons.visibility),
                  ),
                ),
              );
            },
          ),
          SizedBox(
            height: height * 0.04,
          ),
          RoundedButton(
            title: "SignUp",
            loading: authController.load == true,
            onPressed: () {
              if (_emailConroller.text.isEmpty) {
                CommonUtils.getSnackBar(
                    context, "Please Enter the email", false);
              } else if (_passwordConroller.text.isEmpty) {
                CommonUtils.getSnackBar(
                    context, "Please Enter the password", false);
              } else {
                Map data = {
                  // "email": "eve.holt@reqres.in",
                  // "password": "pistol"
                  "email": _emailConroller.text,
                  "password": _passwordConroller.text
                };
                authController.getSignUp(context, data);
              }
            },
          ),
          SizedBox(
            height: height * 0.02,
          ),
          GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: const Text("Alreadu have an account? Login"))
        ],
      ),
    );
  }
}
