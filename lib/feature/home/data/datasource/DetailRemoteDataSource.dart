import 'package:dio/dio.dart';
import 'package:flutter_bloc_demo/feature/home/data/models/DetailChartModel.dart';
import 'package:flutter_bloc_demo/feature/home/presentation/bloc/detail/ChartTimeFrame.dart';


class DetailRemoteDataSource {
  final Dio dio;

  DetailRemoteDataSource(this.dio);

  Future<DetailChartModel> getCoinChart(String? coinUUID,
      ChartTimeFrame? timeFrame) async {
    final qTimeframe = switch(timeFrame){
      ChartTimeFrame.H1 => '1h',
      ChartTimeFrame.H3 => '3h',
      ChartTimeFrame.H12 => '12h',
      ChartTimeFrame.H24 => '24h',
      ChartTimeFrame.D7 => '7d',
      ChartTimeFrame.D30 => '30d',
      ChartTimeFrame.M3 => '3m',
      ChartTimeFrame.Y1 => '1y',
      ChartTimeFrame.Y3 => '3y',
      ChartTimeFrame.Y5 => '5y',
      null => '24h',
    };

    final response = await dio.get(
      'v2/coin/$coinUUID/history',
      data: {
        'x-access-token':
        "coinranking197d6c596b85998a5f498d684933a048fa5534a10ed2c856",
      },
      queryParameters: {
        'timePeriod':
        qTimeframe
      },
    );

    return DetailChartModel.fromJson(response.data);
  }
}
