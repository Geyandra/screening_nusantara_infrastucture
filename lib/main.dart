import 'package:flutter/material.dart';
import 'package:nusantara_infrastucture_assessment/View-Model/auth.dart';
import 'package:nusantara_infrastucture_assessment/View-Model/books.dart';
import 'package:nusantara_infrastucture_assessment/View/home_view.dart';
import 'package:nusantara_infrastucture_assessment/View/login_view.dart';
import 'package:nusantara_infrastucture_assessment/View/registrasi_view.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(providers: [
      ChangeNotifierProvider(create: (_) => AuthViewModel()),
      ChangeNotifierProvider(create: (_) => BookViewModel())
    ],
    child: MyApp(),
    )
    );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Login(),
    );
  }
}