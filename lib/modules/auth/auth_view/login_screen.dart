// ignore_for_file: prefer_final_fields

import 'package:flutter/material.dart';
import 'package:flutter_signin_button/button_list.dart';
import 'package:flutter_signin_button/button_view.dart';
import 'package:food_app/modules/auth/auth_controller/auth_controller.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final authController = Provider.of<AuthController>(context);
    double height = MediaQuery.of(context).size.height * 1;
    double width = MediaQuery.of(context).size.width * 1;
    return SafeArea(
      child: Scaffold(
        body: Container(
          width: width,
          decoration: const BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.fill,
              image: AssetImage('assets/images/background.png'),
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Sign in to cotinue",
                      style: TextStyle(color: Colors.black,fontSize: 18),
                    ),
                    SizedBox(
                      height: height * 0.03,
                    ),
                    Text(
                      "Vegi",
                      style: TextStyle(
                        fontSize: 40,
                        shadows: [
                          BoxShadow(
                            blurRadius: 5,
                            color: Colors.green.shade800,
                            offset: const Offset(3, 3)
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: height * 0.03,
                    ),
                    SignInButton(Buttons.Apple, onPressed: (){}),
                    SizedBox(
                      height: height * 0.015,
                    ),
                    SignInButton(Buttons.Google, onPressed: (){
                      authController.googleSignUp(context);
                    }),
                    SizedBox(
                      height: height * 0.03,
                    ),
                    const Text(
                      "By signin you are agree to  our terms and conditions",
                      style: TextStyle(color: Colors.black,fontSize: 16),
                    ),
                    
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
