// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'article_repository.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$getArticleHash() => r'660e58b4ae83ee768cf2f9036aab25cc18f03081';

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

typedef GetArticleRef = AutoDisposeFutureProviderRef<String?>;

/// See also [getArticle].
@ProviderFor(getArticle)
const getArticleProvider = GetArticleFamily();

/// See also [getArticle].
class GetArticleFamily extends Family<AsyncValue<String?>> {
  /// See also [getArticle].
  const GetArticleFamily();

  /// See also [getArticle].
  GetArticleProvider call({
    required String url,
  }) {
    return GetArticleProvider(
      url: url,
    );
  }

  @override
  GetArticleProvider getProviderOverride(
    covariant GetArticleProvider provider,
  ) {
    return call(
      url: provider.url,
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
  String? get name => r'getArticleProvider';
}

/// See also [getArticle].
class GetArticleProvider extends AutoDisposeFutureProvider<String?> {
  /// See also [getArticle].
  GetArticleProvider({
    required this.url,
  }) : super.internal(
          (ref) => getArticle(
            ref,
            url: url,
          ),
          from: getArticleProvider,
          name: r'getArticleProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$getArticleHash,
          dependencies: GetArticleFamily._dependencies,
          allTransitiveDependencies:
              GetArticleFamily._allTransitiveDependencies,
        );

  final String url;

  @override
  bool operator ==(Object other) {
    return other is GetArticleProvider && other.url == url;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, url.hashCode);

    return _SystemHash.finish(hash);
  }
}
// ignore_for_file: unnecessary_raw_strings, subtype_of_sealed_class, invalid_use_of_internal_member, do_not_use_environment, prefer_const_constructors, public_member_api_docs, avoid_private_typedef_functions
