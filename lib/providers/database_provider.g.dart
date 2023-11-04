// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$databaseServiceHash() => r'c6e4ca566341314a19eaa7b7ac5a6c9f80e43eb8';

/// See also [databaseService].
@ProviderFor(databaseService)
final databaseServiceProvider = Provider<DatabaseService>.internal(
  databaseService,
  name: r'databaseServiceProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$databaseServiceHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef DatabaseServiceRef = ProviderRef<DatabaseService>;
String _$getGroupsOfUserHash() => r'da36e2b479469176ba29bda69f92fd9992a2d4b7';

/// See also [getGroupsOfUser].
@ProviderFor(getGroupsOfUser)
final getGroupsOfUserProvider =
    AutoDisposeFutureProvider<List<GroupModel>>.internal(
  getGroupsOfUser,
  name: r'getGroupsOfUserProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$getGroupsOfUserHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef GetGroupsOfUserRef = AutoDisposeFutureProviderRef<List<GroupModel>>;
String _$userProfileHash() => r'c4cb00540d3e3f4b5d3fa5b27aa3ae9bacf7f671';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

/// See also [userProfile].
@ProviderFor(userProfile)
const userProfileProvider = UserProfileFamily();

/// See also [userProfile].
class UserProfileFamily extends Family<AsyncValue<UserModel?>> {
  /// See also [userProfile].
  const UserProfileFamily();

  /// See also [userProfile].
  UserProfileProvider call(
    String uid,
  ) {
    return UserProfileProvider(
      uid,
    );
  }

  @override
  UserProfileProvider getProviderOverride(
    covariant UserProfileProvider provider,
  ) {
    return call(
      provider.uid,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'userProfileProvider';
}

/// See also [userProfile].
class UserProfileProvider extends FutureProvider<UserModel?> {
  /// See also [userProfile].
  UserProfileProvider(
    String uid,
  ) : this._internal(
          (ref) => userProfile(
            ref as UserProfileRef,
            uid,
          ),
          from: userProfileProvider,
          name: r'userProfileProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$userProfileHash,
          dependencies: UserProfileFamily._dependencies,
          allTransitiveDependencies:
              UserProfileFamily._allTransitiveDependencies,
          uid: uid,
        );

  UserProfileProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.uid,
  }) : super.internal();

  final String uid;

  @override
  Override overrideWith(
    FutureOr<UserModel?> Function(UserProfileRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: UserProfileProvider._internal(
        (ref) => create(ref as UserProfileRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        uid: uid,
      ),
    );
  }

  @override
  FutureProviderElement<UserModel?> createElement() {
    return _UserProfileProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is UserProfileProvider && other.uid == uid;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, uid.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin UserProfileRef on FutureProviderRef<UserModel?> {
  /// The parameter `uid` of this provider.
  String get uid;
}

class _UserProfileProviderElement extends FutureProviderElement<UserModel?>
    with UserProfileRef {
  _UserProfileProviderElement(super.provider);

  @override
  String get uid => (origin as UserProfileProvider).uid;
}

String _$hasUserProfileHash() => r'e63c31aeee107b9cea9753f2f6eaf834415ff8ab';

/// See also [hasUserProfile].
@ProviderFor(hasUserProfile)
final hasUserProfileProvider = Provider<bool>.internal(
  hasUserProfile,
  name: r'hasUserProfileProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$hasUserProfileHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef HasUserProfileRef = ProviderRef<bool>;
String _$groupDetailsHash() => r'a34a4a428a07a94d8dda18c70b9e20e3c391fc3d';

/// See also [groupDetails].
@ProviderFor(groupDetails)
const groupDetailsProvider = GroupDetailsFamily();

/// See also [groupDetails].
class GroupDetailsFamily extends Family<AsyncValue<GroupModel?>> {
  /// See also [groupDetails].
  const GroupDetailsFamily();

  /// See also [groupDetails].
  GroupDetailsProvider call(
    int id,
  ) {
    return GroupDetailsProvider(
      id,
    );
  }

  @override
  GroupDetailsProvider getProviderOverride(
    covariant GroupDetailsProvider provider,
  ) {
    return call(
      provider.id,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'groupDetailsProvider';
}

/// See also [groupDetails].
class GroupDetailsProvider extends AutoDisposeFutureProvider<GroupModel?> {
  /// See also [groupDetails].
  GroupDetailsProvider(
    int id,
  ) : this._internal(
          (ref) => groupDetails(
            ref as GroupDetailsRef,
            id,
          ),
          from: groupDetailsProvider,
          name: r'groupDetailsProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$groupDetailsHash,
          dependencies: GroupDetailsFamily._dependencies,
          allTransitiveDependencies:
              GroupDetailsFamily._allTransitiveDependencies,
          id: id,
        );

  GroupDetailsProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.id,
  }) : super.internal();

  final int id;

  @override
  Override overrideWith(
    FutureOr<GroupModel?> Function(GroupDetailsRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: GroupDetailsProvider._internal(
        (ref) => create(ref as GroupDetailsRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        id: id,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<GroupModel?> createElement() {
    return _GroupDetailsProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is GroupDetailsProvider && other.id == id;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, id.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin GroupDetailsRef on AutoDisposeFutureProviderRef<GroupModel?> {
  /// The parameter `id` of this provider.
  int get id;
}

class _GroupDetailsProviderElement
    extends AutoDisposeFutureProviderElement<GroupModel?> with GroupDetailsRef {
  _GroupDetailsProviderElement(super.provider);

  @override
  int get id => (origin as GroupDetailsProvider).id;
}

String _$nearbyGroupsHash() => r'0d95aa36772b9cbbf87eea9ca184725be469a5f6';

/// See also [nearbyGroups].
@ProviderFor(nearbyGroups)
final nearbyGroupsProvider =
    AutoDisposeFutureProvider<List<GroupSearchResult>>.internal(
  nearbyGroups,
  name: r'nearbyGroupsProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$nearbyGroupsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef NearbyGroupsRef = AutoDisposeFutureProviderRef<List<GroupSearchResult>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
