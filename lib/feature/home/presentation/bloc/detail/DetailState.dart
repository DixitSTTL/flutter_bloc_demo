import 'package:equatable/equatable.dart';

import '../../../data/models/DetailChartModel.dart';
import '../../../data/models/DetailCommonModel.dart';
import '../../../data/models/HomeCoinModel.dart';
import 'ChartTimeFrame.dart';

class DetailState extends Equatable {
  final bool isLoading;
  final List<ChartHistoryData> coins;
  final String? error;
  final ChartTimeFrame timeFrame;
  final String coinId;
  final DetailCommonData? coinData;
  final bool isRefresh;


  const DetailState({
    this.isLoading = false,
    this.coins = const [], // 👈 default empty list
    this.error,
    this.coinId = '',
    this.timeFrame = ChartTimeFrame.H1,
    this.coinData,
    this.isRefresh = false,
  });

  DetailState copyWith({bool? isLoading, List<ChartHistoryData>? coins, String? error, ChartTimeFrame? timeFrame, String? coinId, DetailCommonData? coinData, bool? isRefresh}) {
    return DetailState(
      isLoading: isLoading ?? this.isLoading,
      coins: coins ?? this.coins,
      error: error,
      timeFrame: timeFrame ?? this.timeFrame,
      coinId: coinId??this.coinId,
      coinData: coinData ?? this.coinData,
      isRefresh: isRefresh ?? this.isRefresh,
    );
  }

  @override
  List<Object?> get props => [isLoading, coins, error,timeFrame];
}
