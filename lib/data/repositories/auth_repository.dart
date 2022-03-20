import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:momo_flutter/data/datasources/local/app_database.dart';
import 'package:momo_flutter/data/datasources/remote/auth_client_provider.dart';
import 'package:momo_flutter/data/datasources/remote/retrofit/auth_client.dart';
import 'package:momo_flutter/data/models/auth/login_request.dart';

final authRepositoryProvider = Provider<AuthRepository>((ref) {
  final authClient = ref.watch(authClientProvider);
  return AuthRepository(
    authClient: authClient,
  );
});

class AuthRepository {
  final AuthClient authClient;

  const AuthRepository({
    required this.authClient,
  });

  Future<void> login(LoginRequest loginRequest) {
    return authClient.login(loginRequest).then((value) => AppDatabase().setTokenData(value));
  }
}
