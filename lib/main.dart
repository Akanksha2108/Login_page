import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_application_1/HomePage.dart';
import 'package:flutter_application_1/VideoDetail.dart';
import 'package:flutter_application_1/login.dart';
import 'firebase_options.dart'; // Import your firebase_options.dart file
// import 'package:flutter_application_1/video_detail_page.dart'; // Add this import if the detail page is in a separate file

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: firebaseOptions,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.deepPurple),
      debugShowCheckedModeBanner: false,
      home: Homepage(),
    );
  }
}
