// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$authUserHash() => r'0cc02da2bc9cff14bd334a0d51da612ad99df712';

/// See also [authUser].
@ProviderFor(authUser)
final authUserProvider = AutoDisposeStreamProvider<User?>.internal(
  authUser,
  name: r'authUserProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$authUserHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef AuthUserRef = AutoDisposeStreamProviderRef<User?>;
String _$loggedInUserHash() => r'c7edc4cd29ed20d455229854027daf7236b5ad71';

/// See also [loggedInUser].
@ProviderFor(loggedInUser)
final loggedInUserProvider = AutoDisposeProvider<User>.internal(
  loggedInUser,
  name: r'loggedInUserProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$loggedInUserHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef LoggedInUserRef = AutoDisposeProviderRef<User>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
