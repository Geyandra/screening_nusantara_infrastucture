import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:nusantara_infrastucture_assessment/View-Model/auth.dart';
import 'package:nusantara_infrastucture_assessment/View/registrasi_view.dart';

import '../Widgets/auth_field.dart';
import '../Widgets/pass_auth_field.dart';
import '../Widgets/transition_page.dart';
import 'package:provider/provider.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

final emailcontrol = TextEditingController();
final passcontrol = TextEditingController();

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    final maxwidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text("Login User"),
        centerTitle: true,
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Form(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Authfield(
                  control: emailcontrol,
                  hintText: 'Email',
                  icon: Icons.mail,
                ),
                SizedBox(
                  height: 20,
                ),
                PassAuthfield(
                    control: passcontrol,
                    hintText: "Password",
                    icon: Icons.lock),
                SizedBox(
                  height: 50,
                ),
                ElevatedButton(
                    onPressed: () {
                      context.read<AuthViewModel>().login(email: emailcontrol.text, pass: passcontrol.text, context: context);
                    },
                    style: ElevatedButton.styleFrom(
                      padding:
                          EdgeInsets.symmetric(horizontal: 100, vertical: 20),
                      shape: StadiumBorder(),
                    ),
                    child: Text("Login")),
                SizedBox(
                  height: 20,
                ),
                RichText(
                    text: TextSpan(
                        text: "Don't Have Account?\t",
                        style: TextStyle(color: Colors.black),
                        children: [
                      TextSpan(
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              navPushTransition(context, Registrasi());
                            },
                          text: "Register",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, color: Colors.blue))
                    ]))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
