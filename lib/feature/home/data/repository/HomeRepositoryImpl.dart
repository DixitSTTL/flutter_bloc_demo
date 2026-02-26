import '../../domain/repository/HomeRepository.dart';
import '../datasource/HomeRemoteDataSource.dart';
import '../models/HomeCoinModel.dart';

class HomeRepositoryImpl implements HomeRepository {
  final HomeRemoteDataSource remote;

  HomeRepositoryImpl(this.remote);

  @override
  Future<HomeCoinModel> getAllHomeCoins() async {
    try {
      return await remote.getHomeCoins();
    } catch (e) {
      throw Exception("Login failed");
    }
  }
}
