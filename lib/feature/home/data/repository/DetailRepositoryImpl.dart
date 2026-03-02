import 'package:flutter_bloc_demo/feature/home/data/models/DetailChartModel.dart';
import 'package:flutter_bloc_demo/feature/home/domain/repository/DetailRepository.dart';
import 'package:flutter_bloc_demo/feature/home/presentation/bloc/detail/ChartTimeFrame.dart';

import '../datasource/DetailRemoteDataSource.dart';
import '../models/DetailCommonModel.dart';

class DetailRepositoryImpl implements DetailRepository {
  final DetailRemoteDataSource remote;

  DetailRepositoryImpl(this.remote);

  @override
  Future<DetailChartModel> getCoinChart(String? coinUUID, ChartTimeFrame? timeFrame) async {
    try {
      return await remote.getCoinChart(coinUUID ,timeFrame);
    } catch (e) {
      throw Exception("error");
    }
  }

  @override
  Future<DetailCommonModel> getCoinCommonDetail(String? coinUUID) async {
    try {
      return await remote.getCoinCommonDetail(coinUUID);
    } catch (e) {
      throw Exception("error");
    }
  }



}
