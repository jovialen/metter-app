import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:metter/config/routes/router.dart';
import 'package:metter/core/auth/helpers/validators.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    FirebaseAuth.instance.authStateChanges().listen((user) {
      if (user != null) {
        MetterRouter.router.pop(context);
      }
    });

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => {MetterRouter.router.pop(context)},
          icon: Icon(LucideIcons.chevronLeft),
        ),
        title: Text("Log in"),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  TextFormField(
                    controller: _emailController,
                    validator: emailValidator,
                    decoration: InputDecoration(label: Text("Email")),
                  ),
                  TextFormField(
                    controller: _passwordController,
                    obscureText: true,
                    decoration: InputDecoration(label: Text("Password")),
                  ),
                  TextButton(
                    onPressed: () => submit(context),
                    child: Text("Register"),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void submit(BuildContext context) async {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    final email = _emailController.text;
    final password = _passwordController.text;

    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
    } catch (exception) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text(exception.toString())));
    }
  }
}
