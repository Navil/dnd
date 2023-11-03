// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$authUserHash() => r'c5e026faf5eb61270f7c7114bc678ad52d1e5c96';

/// See also [authUser].
@ProviderFor(authUser)
final authUserProvider = StreamProvider<User?>.internal(
  authUser,
  name: r'authUserProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$authUserHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef AuthUserRef = StreamProviderRef<User?>;
String _$loggedInUserHash() => r'7b78e6db424e26f68e2d5e09c8fa16cc4673e6ae';

/// See also [loggedInUser].
@ProviderFor(loggedInUser)
final loggedInUserProvider = Provider<User>.internal(
  loggedInUser,
  name: r'loggedInUserProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$loggedInUserHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef LoggedInUserRef = ProviderRef<User>;
String _$authServiceHash() => r'd95f6f0327b9783a3e7e039c4caaa93c6a60aa27';

/// See also [authService].
@ProviderFor(authService)
final authServiceProvider = Provider<AuthService>.internal(
  authService,
  name: r'authServiceProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$authServiceHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef AuthServiceRef = ProviderRef<AuthService>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
