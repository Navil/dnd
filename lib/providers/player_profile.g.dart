// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'player_profile.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$playerProfileHash() => r'716afc878cec0ce9072feef217350ce6b48b3c7a';

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
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
