import 'package:flutter/material.dart';
import 'package:metter/config/routes/config.dart';
import 'package:metter/config/routes/router.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Flex(
          mainAxisAlignment: MainAxisAlignment.end,
          spacing: 10.0,
          direction: Axis.vertical,
          children: [
            SizedBox(
              width: double.infinity,
              child: FilledButton(
                onPressed: () =>
                    MetterRouter.router.navigateTo(context, Routes.login),
                style: ButtonStyle(),
                child: const Text("Log in"),
              ),
            ),
            SizedBox(
              width: double.infinity,
              child: FilledButton.tonal(
                onPressed: () =>
                    MetterRouter.router.navigateTo(context, Routes.login),
                child: const Text("Register"),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: const Text(
                "By continuing, you confirm that you have read and agreed to the Terms of Service and consent to the Privacy Policy",
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
