import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:nusantara_infrastucture_assessment/View-Model/auth.dart';
import 'package:nusantara_infrastucture_assessment/View/login_view.dart';
import 'package:nusantara_infrastucture_assessment/Widgets/transition_page.dart';

import '../Widgets/auth_field.dart';
import '../Widgets/pass_auth_field.dart';
import 'package:provider/provider.dart';

class Registrasi extends StatefulWidget {
  const Registrasi({super.key});

  @override
  State<Registrasi> createState() => _RegistrasiState();
}

final namecontrol = TextEditingController();
final emailcontrol = TextEditingController();
final passcontrol = TextEditingController();
final conpasscontrol = TextEditingController();

class _RegistrasiState extends State<Registrasi> {
  @override
  Widget build(BuildContext context) {
    final maxwidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text("Register User"),
        centerTitle: true,
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Form(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Authfield(
                  control: namecontrol,
                  hintText: 'Name',
                  icon: Icons.person,
                ),
                SizedBox(
                  height: 20,
                ),
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
                  height: 20,
                ),
                PassAuthfield(
                    control: conpasscontrol,
                    hintText: "Confirm Password",
                    icon: Icons.lock),
                SizedBox(
                  height: 50,
                ),
                ElevatedButton(
                    onPressed: () {
                      context.read<AuthViewModel>().register(
                          email: emailcontrol.text,
                          name: namecontrol.text,
                          pass: passcontrol.text,
                          conpass: conpasscontrol.text,
                          context: context);
                    },
                    style: ElevatedButton.styleFrom(
                      padding:
                          EdgeInsets.symmetric(horizontal: 100, vertical: 20),
                      shape: StadiumBorder(),
                    ),
                    child: Text("Register")),
                SizedBox(
                  height: 20,
                ),
                RichText(
                    text: TextSpan(
                        text: "Have Account?\t",
                        style: TextStyle(color: Colors.black),
                        children: [
                      TextSpan(
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              navPushTransition(context, Login());
                            },
                          text: "Login",
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
