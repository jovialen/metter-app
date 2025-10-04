import 'package:flutter/material.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:metter/config/routes/config.dart';
import 'package:metter/config/routes/router.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            spacing: 10.0,
            children: [
              Expanded(
                child: Center(
                  child: FittedBox(
                    child: Column(
                      spacing: 10.0,
                      children: [
                        Icon(
                          LucideIcons.user200,
                          color: Theme.of(context).primaryColor,
                          size: 128.0,
                        ),
                        Text(
                          "Welcome",
                          style: Theme.of(context).textTheme.headlineLarge,
                        ),
                        Text(
                          "Sign in or register to continue",
                          textAlign: TextAlign.center,
                          style: Theme.of(context).textTheme.labelLarge,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: double.infinity,
                child: FilledButton(
                  onPressed: () => MetterRouter.router.push(Routes.login),
                  style: ButtonStyle(),
                  child: const Text("Log in"),
                ),
              ),
              SizedBox(
                width: double.infinity,
                child: FilledButton.tonal(
                  onPressed: () => MetterRouter.router.push(Routes.register),
                  child: const Text("Register"),
                ),
              ),
              FractionallySizedBox(
                widthFactor: 0.75,
                child: RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    style: Theme.of(context).textTheme.bodySmall,
                    text:
                        "By continuing, you confirm that you've read and agreed to the ",
                    children: [
                      TextSpan(
                        text: "Terms of Service",
                        style: TextStyle(
                          color: Colors.blue,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                      TextSpan(text: " and consent to the "),
                      TextSpan(
                        text: "Privacy Policy",
                        style: TextStyle(
                          color: Colors.blue,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
