import 'package:equatable/equatable.dart';

import '../../../data/models/DetailChartModel.dart';
import '../../../data/models/HomeCoinModel.dart';
import 'ChartTimeFrame.dart';

class DetailState extends Equatable {
  final bool isLoading;
  final List<ChartHistoryData> coins;
  final String? error;
  final ChartTimeFrame? timeFrame;
  final String coinId;


  const DetailState({
    this.isLoading = false,
    this.coins = const [], // 👈 default empty list
    this.error,
    this.coinId = '',
    this.timeFrame,
  });

  DetailState copyWith({bool? isLoading, List<ChartHistoryData>? coins, String? error, ChartTimeFrame? timeFrame, String? coinId}) {
    return DetailState(
      isLoading: isLoading ?? this.isLoading,
      coins: coins ?? this.coins,
      error: error,
      timeFrame: timeFrame ?? this.timeFrame,
      coinId: coinId??this.coinId,
    );
  }

  @override
  List<Object?> get props => [isLoading, coins, error,timeFrame];
}
