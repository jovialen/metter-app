import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:metter/config/firebase/firebase_options.dart';
import 'package:metter/config/routes/router.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize firebase
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  // Refresh the page on auth state changes
  FirebaseAuth.instance.authStateChanges().listen((user) {
    MetterRouter.router.refresh();
  });

  runApp(const MetterApp());
}

class MetterApp extends StatefulWidget {
  const MetterApp({super.key});

  @override
  State<MetterApp> createState() => _MetterAppState();
}

class _MetterAppState extends State<MetterApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: "Metter",
      theme: ThemeData(colorSchemeSeed: Colors.green),
      routerConfig: MetterRouter.router,
      debugShowCheckedModeBanner: false,
    );
  }
}
