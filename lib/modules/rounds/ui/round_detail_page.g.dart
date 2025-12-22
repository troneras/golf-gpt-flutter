// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'round_detail_page.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(roundDetail)
const roundDetailProvider = RoundDetailFamily._();

final class RoundDetailProvider
    extends $FunctionalProvider<AsyncValue<Round>, Round, FutureOr<Round>>
    with $FutureModifier<Round>, $FutureProvider<Round> {
  const RoundDetailProvider._({
    required RoundDetailFamily super.from,
    required String super.argument,
  }) : super(
         retry: null,
         name: r'roundDetailProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$roundDetailHash();

  @override
  String toString() {
    return r'roundDetailProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $FutureProviderElement<Round> $createElement($ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<Round> create(Ref ref) {
    final argument = this.argument as String;
    return roundDetail(ref, argument);
  }

  @override
  bool operator ==(Object other) {
    return other is RoundDetailProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$roundDetailHash() => r'a10823cee4b29c6854a9e06b078c6b7a61e4f47a';

final class RoundDetailFamily extends $Family
    with $FunctionalFamilyOverride<FutureOr<Round>, String> {
  const RoundDetailFamily._()
    : super(
        retry: null,
        name: r'roundDetailProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  RoundDetailProvider call(String roundId) =>
      RoundDetailProvider._(argument: roundId, from: this);

  @override
  String toString() => r'roundDetailProvider';
}
