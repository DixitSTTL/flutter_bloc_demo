import 'package:dio/dio.dart';
import 'package:flutter_bloc_demo/feature/home/data/models/DetailChartModel.dart';
import 'package:flutter_bloc_demo/feature/home/data/models/DetailCommonModel.dart';
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
        "coinranking6d3fc7d07b6098adcfcaaa8c702ef36d817b23632e4dd5e4",
      },
      queryParameters: {
        'timePeriod':
        qTimeframe
      },
    );

    return DetailChartModel.fromJson(response.data);
  }


  Future<DetailCommonModel> getCoinCommonDetail(String? coinUUID) async {


    final response = await dio.get(
      'v2/coin/$coinUUID',
      data: {
        'x-access-token':
        "coinranking6d3fc7d07b6098adcfcaaa8c702ef36d817b23632e4dd5e4",
      }
    );

    return DetailCommonModel.fromJson(response.data);
  }
}
