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
            "coinranking6d3fc7d07b6098adcfcaaa8c702ef36d817b23632e4dd5e4",
      },
    );

    return HomeCoinModel.fromJson(response.data);
  }
}
