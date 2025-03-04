import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:thesiiiis/LoginPage.dart';
import 'package:thesiiiis/pages/homepage.dart';

import 'MainPages.dart';

void main() async {
    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LoginPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
