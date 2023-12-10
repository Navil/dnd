class Env {
  static const supabaseAnonKey = String.fromEnvironment('SUPABASE_ANON_KEY');
  static const subabaseUrl = String.fromEnvironment("SUPABASE_URL");
  static const googlePlacesKey = String.fromEnvironment("GOOGLE_PLACES_KEY");
  static const googleOAuthClientAndroid =
      String.fromEnvironment("GOOGLE_OAUTH_CLIENT_ANDROID");
  static const googleOAuthClientIos =
      String.fromEnvironment("GOOGLE_OAUTH_CLIENT_IOS");
  static const googleOAuthClientWeb =
      String.fromEnvironment("GOOGLE_OAUTH_CLIENT_WEB");
  static const isProduction = bool.fromEnvironment("IS_PRODUCTION");
  static const sentryUrl = String.fromEnvironment("SENTRY_URL");
}
