import 'package:flutter_bloc_demo/feature/home/presentation/bloc/detail/ChartTimeFrame.dart';

import '../../data/models/DetailChartModel.dart';

abstract class DetailRepository {
  Future<DetailChartModel> getCoinChart(String? coinUUID, ChartTimeFrame? timeFrame);
}
