import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:portfolio/firebase_options.dart';
import 'package:portfolio/image_from_firebase.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'M.H. Rahmani: Portfolio',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Welcome to my homepage!'),
          actions: const [ImageFromFirebase(filePath: 'img/profile.jpg')],
          centerTitle: true,
        ),
        body: const Center(
          child: Text('Hello World!'),
        ),
      ),
    );
  }
}
