// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$authUserHash() => r'1b5fe7c619a1bbf28e86648e395cbb7630b8d849';

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
String _$loggedInUserHash() => r'083af9ea68a71d4006f22f6c594cb70cc56a60d6';

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
