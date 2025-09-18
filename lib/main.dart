import 'package:firebase_core/firebase_core.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:metter/config/firebase/firebase_options.dart';
import 'package:metter/config/routes/config.dart';
import 'package:metter/config/routes/router.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize firebase
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  runApp(const MetterApp());
}

class MetterApp extends StatefulWidget {
  const MetterApp({super.key});

  @override
  State<MetterApp> createState() => _MetterAppState();
}

class _MetterAppState extends State<MetterApp> {
  _MetterAppState() {
    // Create app router, and make it globally available.
    final router = FluroRouter();
    Routes.configureRoutes(router);
    MetterRouter.router = router;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Metter",
      theme: ThemeData(colorSchemeSeed: Colors.green),
      initialRoute: Routes.root,
      onGenerateRoute: MetterRouter.router.generator,
      debugShowCheckedModeBanner: false,
    );
  }
}
