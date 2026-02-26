import 'package:equatable/equatable.dart';
import 'package:flutter_bloc_demo/feature/home/presentation/bloc/detail/ChartTimeFrame.dart';

abstract class DetailEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class CoinChartRequested extends DetailEvent {
  final String coinId;

  CoinChartRequested(this.coinId);

  @override
  List<Object?> get props => [coinId];
}


class TimeFrameChanged extends DetailEvent {
  final ChartTimeFrame timeFrame;
  final String coinId;

  TimeFrameChanged(this.timeFrame, this.coinId);

  @override
  List<Object?> get props => [timeFrame,coinId];
}

