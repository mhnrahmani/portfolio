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

  final String profilePhotoPath = 'img/profile.jpg';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'M.H. Rahmani: Portfolio',
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Welcome to my homepage!'),
          // actions: const [ImageFromFirebase(filePath: 'img/profile.jpg')],
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              const Text(
                'This site is still under construction. I am adding a timeline of my projects and more information about me. Stay tuned!',
                style: TextStyle(fontSize: 24),
              ),
              const SizedBox(height: 40),
              Center(
                child: FractionallySizedBox(
                  widthFactor: 0.4,
                  child: ClipOval(
                      child: ImageFromFirebase(filePath: profilePhotoPath)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
