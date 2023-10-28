import 'package:dnd/services/auth_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart' hide Provider;

final authStateProvider = StreamProvider(
    (ref) => Supabase.instance.client.auth.onAuthStateChange.map((event) {
          return event.session?.user;
        }));

final authServiceProvider = Provider<AuthService>((ref) => AuthService());
