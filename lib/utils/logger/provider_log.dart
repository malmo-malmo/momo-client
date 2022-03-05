import 'dart:developer';

import 'package:flutter_riverpod/flutter_riverpod.dart';

class ProviderLogger extends ProviderObserver {
  @override
  void didAddProvider(
    ProviderBase provider,
    Object? value,
    ProviderContainer container,
  ) {
    log(
      '''
providerAdd: ${provider.name ?? provider.runtimeType}
value: $value
''',
    );
    super.didAddProvider(provider, value, container);
  }

  @override
  void didUpdateProvider(
    ProviderBase provider,
    Object? previousValue,
    Object? newValue,
    ProviderContainer container,
  ) {
    log(
      '''
providerUpdate: ${provider.name ?? provider.runtimeType}
newValue: $newValue
      ''',
    );
    super.didUpdateProvider(provider, previousValue, newValue, container);
  }

  @override
  void didDisposeProvider(
    ProviderBase provider,
    ProviderContainer containers,
  ) {
    log('providerDispose: ${provider.name ?? provider.runtimeType}');
    super.didDisposeProvider(provider, containers);
  }
}
