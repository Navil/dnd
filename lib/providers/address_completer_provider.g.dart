// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'address_completer_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$addressAutocompleteHash() =>
    r'8b53da13bfade1fb1318895fe92464dd2b91b293';

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

/// See also [addressAutocomplete].
@ProviderFor(addressAutocomplete)
const addressAutocompleteProvider = AddressAutocompleteFamily();

/// See also [addressAutocomplete].
class AddressAutocompleteFamily
    extends Family<AsyncValue<List<AutocompletePrediction>>> {
  /// See also [addressAutocomplete].
  const AddressAutocompleteFamily();

  /// See also [addressAutocomplete].
  AddressAutocompleteProvider call(
    String query,
  ) {
    return AddressAutocompleteProvider(
      query,
    );
  }

  @override
  AddressAutocompleteProvider getProviderOverride(
    covariant AddressAutocompleteProvider provider,
  ) {
    return call(
      provider.query,
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
  String? get name => r'addressAutocompleteProvider';
}

/// See also [addressAutocomplete].
class AddressAutocompleteProvider
    extends AutoDisposeFutureProvider<List<AutocompletePrediction>> {
  /// See also [addressAutocomplete].
  AddressAutocompleteProvider(
    String query,
  ) : this._internal(
          (ref) => addressAutocomplete(
            ref as AddressAutocompleteRef,
            query,
          ),
          from: addressAutocompleteProvider,
          name: r'addressAutocompleteProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$addressAutocompleteHash,
          dependencies: AddressAutocompleteFamily._dependencies,
          allTransitiveDependencies:
              AddressAutocompleteFamily._allTransitiveDependencies,
          query: query,
        );

  AddressAutocompleteProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.query,
  }) : super.internal();

  final String query;

  @override
  Override overrideWith(
    FutureOr<List<AutocompletePrediction>> Function(
            AddressAutocompleteRef provider)
        create,
  ) {
    return ProviderOverride(
      origin: this,
      override: AddressAutocompleteProvider._internal(
        (ref) => create(ref as AddressAutocompleteRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        query: query,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<List<AutocompletePrediction>>
      createElement() {
    return _AddressAutocompleteProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is AddressAutocompleteProvider && other.query == query;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, query.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin AddressAutocompleteRef
    on AutoDisposeFutureProviderRef<List<AutocompletePrediction>> {
  /// The parameter `query` of this provider.
  String get query;
}

class _AddressAutocompleteProviderElement
    extends AutoDisposeFutureProviderElement<List<AutocompletePrediction>>
    with AddressAutocompleteRef {
  _AddressAutocompleteProviderElement(super.provider);

  @override
  String get query => (origin as AddressAutocompleteProvider).query;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
