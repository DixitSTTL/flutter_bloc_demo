import 'package:equatable/equatable.dart';

import '../../../data/models/DetailChartModel.dart';
import '../../../data/models/DetailCommonModel.dart';
import '../../../data/models/HomeCoinModel.dart';
import 'ChartTimeFrame.dart';

class DetailState extends Equatable {
  final bool isLoading;
  final List<ChartHistoryData> coins;
  final String? error;
  final ChartTimeFrame? timeFrame;
  final String coinId;
  final DetailCommonData? coinData;


  const DetailState({
    this.isLoading = false,
    this.coins = const [], // 👈 default empty list
    this.error,
    this.coinId = '',
    this.timeFrame,
    this.coinData,
  });

  DetailState copyWith({bool? isLoading, List<ChartHistoryData>? coins, String? error, ChartTimeFrame? timeFrame, String? coinId, DetailCommonData? coinData}) {
    return DetailState(
      isLoading: isLoading ?? this.isLoading,
      coins: coins ?? this.coins,
      error: error,
      timeFrame: timeFrame ?? this.timeFrame,
      coinId: coinId??this.coinId,
      coinData: coinData ?? this.coinData,
    );
  }

  @override
  List<Object?> get props => [isLoading, coins, error,timeFrame];
}
