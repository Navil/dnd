import 'dart:convert';
import 'dart:math';

import 'package:crypto/crypto.dart';
import 'package:dnd/env.dart';
import 'package:flutter/foundation.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AuthService {
  final supabase = Supabase.instance.client;

  //TODO: use generateRawNonce from supabase
  String _generateRandomString() {
    final random = Random.secure();
    return base64Url.encode(List<int>.generate(16, (_) => random.nextInt(256)));
  }

  Future<void> loginApple() async {
    final rawNonce = _generateRandomString();
    final hashedNonce = sha256.convert(utf8.encode(rawNonce)).toString();

    final credential = await SignInWithApple.getAppleIDCredential(
      webAuthenticationOptions: WebAuthenticationOptions(
          clientId: "com.dndvalley",
          redirectUri: Uri.parse("${Env.subabaseUrl}/auth/v1/callback")),
      scopes: [
        AppleIDAuthorizationScopes.fullName,
      ],
      nonce: hashedNonce,
    );

    final idToken = credential.identityToken;
    if (idToken == null) {
      throw const AuthException(
          'Could not find ID Token from generated credential.');
    }

    await supabase.auth.signInWithIdToken(
      provider: OAuthProvider.apple,
      idToken: idToken,
      nonce: rawNonce,
    );
  }

  Future<void> loginGoogle() async {
    debugPrint('Loging in Google');
    const String webClientId = Env.googleOAuthClientWeb;

    const String iosClientId = Env.googleOAuthClientIos;

    final GoogleSignIn googleSignIn =
        GoogleSignIn(clientId: iosClientId, serverClientId: webClientId);
    final googleUser = await googleSignIn.signIn();
    final googleAuth = await googleUser!.authentication;
    final accessToken = googleAuth.accessToken;
    final idToken = googleAuth.idToken;

    if (accessToken == null) {
      throw 'No Access Token found.';
    }
    if (idToken == null) {
      throw 'No ID Token found.';
    }

    await supabase.auth.signInWithIdToken(
      provider: OAuthProvider.google,
      idToken: idToken,
      accessToken: accessToken,
    );
  }

  loginTestuser1() async {
    await supabase.auth
        .signInWithPassword(email: "test1@test.com", password: "test1");
  }

  loginTestuser2() async {
    await supabase.auth
        .signInWithPassword(email: "test2@test.com", password: "test2");
  }

  logout() async {
    await supabase.auth.signOut();
  }
}
