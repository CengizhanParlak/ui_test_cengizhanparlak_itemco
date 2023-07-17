// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'most_popular_service.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$getMostPopularHash() => r'2f91306b5bedee2e665946bf2186d5b0e67a56b3';

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

typedef GetMostPopularRef
    = AutoDisposeFutureProviderRef<Either<ApiError, MostPopular?>>;

/// See also [getMostPopular].
@ProviderFor(getMostPopular)
const getMostPopularProvider = GetMostPopularFamily();

/// See also [getMostPopular].
class GetMostPopularFamily
    extends Family<AsyncValue<Either<ApiError, MostPopular?>>> {
  /// See also [getMostPopular].
  const GetMostPopularFamily();

  /// See also [getMostPopular].
  GetMostPopularProvider call({
    required Period period,
  }) {
    return GetMostPopularProvider(
      period: period,
    );
  }

  @override
  GetMostPopularProvider getProviderOverride(
    covariant GetMostPopularProvider provider,
  ) {
    return call(
      period: provider.period,
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
  String? get name => r'getMostPopularProvider';
}

/// See also [getMostPopular].
class GetMostPopularProvider
    extends AutoDisposeFutureProvider<Either<ApiError, MostPopular?>> {
  /// See also [getMostPopular].
  GetMostPopularProvider({
    required this.period,
  }) : super.internal(
          (ref) => getMostPopular(
            ref,
            period: period,
          ),
          from: getMostPopularProvider,
          name: r'getMostPopularProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$getMostPopularHash,
          dependencies: GetMostPopularFamily._dependencies,
          allTransitiveDependencies:
              GetMostPopularFamily._allTransitiveDependencies,
        );

  final Period period;

  @override
  bool operator ==(Object other) {
    return other is GetMostPopularProvider && other.period == period;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, period.hashCode);

    return _SystemHash.finish(hash);
  }
}
// ignore_for_file: unnecessary_raw_strings, subtype_of_sealed_class, invalid_use_of_internal_member, do_not_use_environment, prefer_const_constructors, public_member_api_docs, avoid_private_typedef_functions
