import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:food_app/modules/auth/auth_controller/auth_controller.dart';

class SpalshScreen extends StatefulWidget {
  const SpalshScreen({super.key});

  @override
  State<SpalshScreen> createState() => _SpalshScreenState();
}

class _SpalshScreenState extends State<SpalshScreen> {
  @override
  void initState() {
    Provider.of<AuthController>(context,listen: false).getUserToken(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text("Splash Screen"),
      ),
    );
  }
}
