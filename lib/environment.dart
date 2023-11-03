import 'package:flutter_dotenv/flutter_dotenv.dart';

class Environment {
  static final supabaseAnonKey = dotenv.env['SUPABASE_ANON_KEY']!;
  static final subabaseUrl = dotenv.env["SUPABASE_URL"]!;
}
