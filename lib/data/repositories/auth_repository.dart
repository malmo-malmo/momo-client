import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:momo_flutter/data/datasources/local/app_database.dart';
import 'package:momo_flutter/data/datasources/remote/auth_client_provider.dart';
import 'package:momo_flutter/data/datasources/remote/retrofit/auth_client.dart';
import 'package:momo_flutter/data/models/auth/login_request.dart';

final authRepositoryProvider = Provider<AuthRepository>((ref) {
  final authClient = ref.watch(authClientProvider);
  final appDatabase = ref.watch(appDatabaseProvider);
  return AuthRepository(
    authClient: authClient,
    appDatabase: appDatabase,
  );
});

class AuthRepository {
  final AuthClient authClient;
  final AppDatabase appDatabase;

  const AuthRepository({
    required this.authClient,
    required this.appDatabase,
  });

  Future<void> login(LoginRequest loginRequest) {
    return authClient.login(loginRequest).then((value) => appDatabase.setTokenData(value));
  }
}
