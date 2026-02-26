import '../../data/models/HomeCoinModel.dart';

abstract class HomeRepository {
  Future<HomeCoinModel> getAllHomeCoins();
}
