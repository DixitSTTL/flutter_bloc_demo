import '../../domain/entities/User.dart';
import '../../domain/repository/AuthRepository.dart';
import '../datasource/AuthRemoteDataSource.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource remote;

  AuthRepositoryImpl(this.remote);

  @override
  Future<User> login(String email, String password) async {
    try {
      return await remote.login(email, password);
    } catch (e) {
      throw Exception("Login failed");
    }
  }
}
