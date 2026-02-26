import 'package:dio/dio.dart';

import '../models/HomeCoinModel.dart';

class HomeRemoteDataSource {
  final Dio dio;

  HomeRemoteDataSource(this.dio);

  Future<HomeCoinModel> getHomeCoins() async {
    final response = await dio.get(
      'v2/coins',
      data: {
        'x-access-token':
            "coinranking197d6c596b85998a5f498d684933a048fa5534a10ed2c856",
      },
    );

    return HomeCoinModel.fromJson(response.data);
  }
}
