import 'dart:convert';
import 'dart:io';
import 'dart:math';

import 'package:crypto/crypto.dart';
import 'package:flutter/material.dart';
import 'package:flutter_appauth/flutter_appauth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart' hide Provider;
import 'package:google_sign_in/google_sign_in.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

final authProvider = StateNotifierProvider<AuthService, User?>((ref) {
  return AuthService();
});

class AuthService extends StateNotifier<User?> {
  final supabase = Supabase.instance.client;
  AuthService() : super(null) {
    _init();
  }

  Future<void> _init() async {
    var user = Supabase.instance.client.auth.currentUser;
    state = user;
    Supabase.instance.client.auth.onAuthStateChange.listen((authState) {
      state = authState.session?.user;
    });
  }

  Future<void> loginApple() async {
    /*
    try {
      final appleProvider = firebase.AppleAuthProvider();
      appleProvider.addScope("email");
      appleProvider.addScope("name");
      final creds = await firebase.FirebaseAuth.instance
          .signInWithProvider(appleProvider);
      await realmLogin(creds, LoginProvider.apple);
    } catch (error, stackTrace) {
      await Sentry.captureException(error, stackTrace: stackTrace);
    }
    */
  }

  /// Function to generate a random 16 character string.
  String _generateRandomString() {
    final random = Random.secure();
    return base64Url.encode(List<int>.generate(16, (_) => random.nextInt(256)));
  }

  Future<void> loginGoogle() async {
    debugPrint('Loging in Google');

    final clientId = Platform.isIOS
        ? '505188764209-ovv4rlth4mbhu4q42urteeptmehpfauh.apps.googleusercontent.com'
        : '505188764209-e5dh6shttbrmaaian6ifbv8ql1ulrgbo.apps.googleusercontent.com';
    late final String? idToken;
    late final String? accessToken;
    String? rawNonce;

    // Use AppAuth to perform Google sign in on iOS
    // and use GoogleSignIn package for Google sign in on Android
    if (Platform.isIOS) {
      const appAuth = FlutterAppAuth();

      // Just a random string
      rawNonce = _generateRandomString();
      final hashedNonce = sha256.convert(utf8.encode(rawNonce)).toString();

      /// Set as reversed DNS form of Google Client ID + `:/` for Google login
      final redirectUrl = '${clientId.split('.').reversed.join('.')}:/';

      /// Fixed value for google login
      const discoveryUrl =
          'https://accounts.google.com/.well-known/openid-configuration';

      // authorize the user by opening the concent page
      final result = await appAuth.authorize(
        AuthorizationRequest(
          clientId,
          redirectUrl,
          discoveryUrl: discoveryUrl,
          nonce: hashedNonce,
          scopes: [
            'openid',
            'email',
            'profile',
          ],
        ),
      );

      if (result == null) {
        throw 'No result';
      }

      // Request the access and id token to google
      final tokenResult = await appAuth.token(
        TokenRequest(
          clientId,
          redirectUrl,
          authorizationCode: result.authorizationCode,
          discoveryUrl: discoveryUrl,
          codeVerifier: result.codeVerifier,
          nonce: result.nonce,
          scopes: [
            'openid',
            'email',
          ],
        ),
      );

      accessToken = tokenResult?.accessToken;
      idToken = tokenResult?.idToken;
    } else {
      final GoogleSignIn googleSignIn = GoogleSignIn(
        serverClientId: clientId,
        scopes: [
          'openid',
          'email',
        ],
      );
      final googleUser = await googleSignIn.signIn();
      final googleAuth = await googleUser!.authentication;
      accessToken = googleAuth.accessToken;
      idToken = googleAuth.idToken;
    }

    if (idToken == null) {
      throw 'No ID Token';
    }
    if (accessToken == null) {
      throw 'No Access Token';
    }

    await supabase.auth.signInWithIdToken(
      provider: Provider.google,
      idToken: idToken,
      accessToken: accessToken,
      nonce: rawNonce,
    );
  }

  logout() async {
    await supabase.auth.signOut();
  }
}
