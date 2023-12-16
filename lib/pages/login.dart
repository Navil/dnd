import 'package:dnd/providers/auth_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LoginPage extends ConsumerStatefulWidget {
  static const loginButton = "login_login_button";
  static const registerButton = "login_register_button";
  static const emailInput = "login_email_input";
  static const passwordInput = "login_password_input";
  const LoginPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _LoginPageState();
}

class _LoginPageState extends ConsumerState<LoginPage> {
  final TextEditingController _email =
      TextEditingController(text: "test@test.com");
  final TextEditingController _password = TextEditingController(text: "123456");

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Column(
      children: [
        ElevatedButton(
            onPressed: () => ref.read(authServiceProvider).loginGoogle(),
            child: const Text("Google")),
        ElevatedButton(
            onPressed: () => ref.read(authServiceProvider).loginApple(),
            child: const Text("Apple")),
        ElevatedButton(
            onPressed: () => ref.read(authServiceProvider).loginTestuser1(),
            child: const Text("Testuser 1")),
        ElevatedButton(
            onPressed: () => ref.read(authServiceProvider).loginTestuser2(),
            child: const Text("Testuser 2")),
        Column(
          children: [
            TextField(
              key: const Key(LoginPage.emailInput),
              controller: _email,
              keyboardType: TextInputType.emailAddress,
            ),
            TextField(
              key: const Key(LoginPage.passwordInput),
              controller: _password,
              obscureText: true,
            ),
            Row(
              children: [
                ElevatedButton(
                    key: const Key(LoginPage.loginButton),
                    onPressed: () => ref
                        .read(authServiceProvider)
                        .loginEmail(_email.text, _password.text),
                    child: const Text("Login")),
                ElevatedButton(
                    key: const Key(LoginPage.registerButton),
                    onPressed: () => ref
                        .read(authServiceProvider)
                        .registerEmail(_email.text, _password.text),
                    child: const Text("Register"))
              ],
            )
          ],
        )
      ],
    ));
  }
}
