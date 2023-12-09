import 'package:flutter_dotenv/flutter_dotenv.dart';

class Environment {
  static final supabaseAnonKey = dotenv.env['SUPABASE_ANON_KEY']!;
  static final subabaseUrl = dotenv.env["SUPABASE_URL"]!;
  static final googlePlacesKey = dotenv.env["GOOGLE_PLACES_KEY"]!;
  static final googleOAuthClientAndroid =
      dotenv.env["GOOGLE_OAUTH_CLIENT_ANDROID"]!;
  static final googleOAuthClientIos = dotenv.env["GOOGLE_OAUTH_CLIENT_IOS"]!;
  static final googleOAuthClientWeb = dotenv.env["GOOGLE_OAUTH_CLIENT_WEB"]!;
  static final isProduction = dotenv.env["IS_PRODUCTION"] == "true";
  static final sentryUrl = dotenv.env["SENTRY_URL"]!;
}
