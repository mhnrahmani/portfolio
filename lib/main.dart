import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:portfolio/firebase_options.dart';
import 'package:portfolio/image_from_firebase.dart';
import 'package:url_launcher/url_launcher.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  final String pathProfile = 'img/profile.jpg';

  // Define the URLs
  final String linkedinUrl = 'https://www.linkedin.com/in/mhnrahmani/';
  final String scholarUrl =
      'https://scholar.google.com/citations?user=Avb2u10AAAAJ';
  final String universityUrl =
      'https://www.uantwerpen.be/en/staff/mohammad-rahmani/';
  final String orcidUrl = 'https://orcid.org/0000-0002-0241-8270';
  final String researchgateUrl =
      'https://www.researchgate.net/profile/Mohammad-Hasan-Rahmani-2';
  final String githubUrl = 'https://github.com/mhnrahmani/';

  // Method to launch URLs
  Future<void> _launchURL(String url) async {
    final Uri uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'M.H. Rahmani: Portfolio',
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text(
              'I am adding a timeline of my projects and more information about me. Stay tuned!'),
          actions: [
            IconButton(
              icon: const Icon(FontAwesomeIcons.orcid),
              onPressed: () => _launchURL(orcidUrl),
              tooltip: 'ORCID Profile',
            ),
            IconButton(
              icon: const Icon(FontAwesomeIcons.googleScholar),
              onPressed: () => _launchURL(scholarUrl),
              tooltip: 'Google Scholar Profile',
            ),
            IconButton(
              icon: const Icon(FontAwesomeIcons.researchgate),
              onPressed: () => _launchURL(researchgateUrl),
              tooltip: 'ResearchGate Profile',
            ),
            IconButton(
              icon: const Icon(FontAwesomeIcons.github),
              onPressed: () => _launchURL(githubUrl),
              tooltip: 'GitHub Profile',
            ),
            IconButton(
              icon: const Icon(FontAwesomeIcons.linkedin),
              onPressed: () => _launchURL(linkedinUrl),
              tooltip: 'LinkedIn Profile',
            ),
            const SizedBox(width: 10), // Adds some space before the edge
          ],
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 40),
              Center(
                child: FractionallySizedBox(
                  widthFactor: 0.4,
                  child:
                      ClipOval(child: ImageFromFirebase(filePath: pathProfile)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
