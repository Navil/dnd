// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$databaseServiceHash() => r'403f552a67b3aab00ac6a1b71cc693cffaba9002';

/// See also [databaseService].
@ProviderFor(databaseService)
final databaseServiceProvider = AutoDisposeProvider<DatabaseService>.internal(
  databaseService,
  name: r'databaseServiceProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$databaseServiceHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef DatabaseServiceRef = AutoDisposeProviderRef<DatabaseService>;
String _$getGroupsOfPlayerHash() => r'd9d2af624cfcf9524884d4fb8170948c0f10229e';

/// See also [getGroupsOfPlayer].
@ProviderFor(getGroupsOfPlayer)
final getGroupsOfPlayerProvider =
    AutoDisposeFutureProvider<List<Group>>.internal(
  getGroupsOfPlayer,
  name: r'getGroupsOfPlayerProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$getGroupsOfPlayerHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef GetGroupsOfPlayerRef = AutoDisposeFutureProviderRef<List<Group>>;
String _$playerProfileHash() => r'ad2416f4ea588799cdb4e7fb96545dc9b2acdab7';

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

/// See also [playerProfile].
@ProviderFor(playerProfile)
const playerProfileProvider = PlayerProfileFamily();

/// See also [playerProfile].
class PlayerProfileFamily extends Family<AsyncValue<Player?>> {
  /// See also [playerProfile].
  const PlayerProfileFamily();

  /// See also [playerProfile].
  PlayerProfileProvider call(
    String uid,
  ) {
    return PlayerProfileProvider(
      uid,
    );
  }

  @override
  PlayerProfileProvider getProviderOverride(
    covariant PlayerProfileProvider provider,
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
  String? get name => r'playerProfileProvider';
}

/// See also [playerProfile].
class PlayerProfileProvider extends AutoDisposeFutureProvider<Player?> {
  /// See also [playerProfile].
  PlayerProfileProvider(
    String uid,
  ) : this._internal(
          (ref) => playerProfile(
            ref as PlayerProfileRef,
            uid,
          ),
          from: playerProfileProvider,
          name: r'playerProfileProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$playerProfileHash,
          dependencies: PlayerProfileFamily._dependencies,
          allTransitiveDependencies:
              PlayerProfileFamily._allTransitiveDependencies,
          uid: uid,
        );

  PlayerProfileProvider._internal(
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
    FutureOr<Player?> Function(PlayerProfileRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: PlayerProfileProvider._internal(
        (ref) => create(ref as PlayerProfileRef),
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
  AutoDisposeFutureProviderElement<Player?> createElement() {
    return _PlayerProfileProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is PlayerProfileProvider && other.uid == uid;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, uid.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin PlayerProfileRef on AutoDisposeFutureProviderRef<Player?> {
  /// The parameter `uid` of this provider.
  String get uid;
}

class _PlayerProfileProviderElement
    extends AutoDisposeFutureProviderElement<Player?> with PlayerProfileRef {
  _PlayerProfileProviderElement(super.provider);

  @override
  String get uid => (origin as PlayerProfileProvider).uid;
}

String _$groupDetailsHash() => r'f65acdccc2b9fa01f5f2272f272ed53ac3c05a2a';

/// See also [groupDetails].
@ProviderFor(groupDetails)
const groupDetailsProvider = GroupDetailsFamily();

/// See also [groupDetails].
class GroupDetailsFamily extends Family<AsyncValue<Group?>> {
  /// See also [groupDetails].
  const GroupDetailsFamily();

  /// See also [groupDetails].
  GroupDetailsProvider call(
    dynamic id,
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
class GroupDetailsProvider extends AutoDisposeFutureProvider<Group?> {
  /// See also [groupDetails].
  GroupDetailsProvider(
    dynamic id,
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

  final dynamic id;

  @override
  Override overrideWith(
    FutureOr<Group?> Function(GroupDetailsRef provider) create,
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
  AutoDisposeFutureProviderElement<Group?> createElement() {
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

mixin GroupDetailsRef on AutoDisposeFutureProviderRef<Group?> {
  /// The parameter `id` of this provider.
  dynamic get id;
}

class _GroupDetailsProviderElement
    extends AutoDisposeFutureProviderElement<Group?> with GroupDetailsRef {
  _GroupDetailsProviderElement(super.provider);

  @override
  dynamic get id => (origin as GroupDetailsProvider).id;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
