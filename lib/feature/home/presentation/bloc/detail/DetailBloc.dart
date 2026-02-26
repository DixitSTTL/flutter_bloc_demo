import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/repository/DetailRepository.dart';
import 'DetailEvent.dart';
import 'DetailState.dart';

class DetailBloc extends Bloc<DetailEvent, DetailState> {
  final DetailRepository repository;

  DetailBloc(this.repository) : super(const DetailState()) {
    on<CoinChartRequested>(_onGetCoinChart);
    on<TimeFrameChanged>(_onTimeFrameChange);
  }

  FutureOr<void> _onGetCoinChart(
    CoinChartRequested event,
    Emitter<DetailState> emit,
  ) async {
    try {
      emit(state.copyWith(
        isLoading: true,
        coinId: event.coinId,
      ));
      await _fetchChart(emit);

    } catch (e) {
      emit(state.copyWith(isLoading: false, error: e.toString()));
    }
  }

  Future<void> _onTimeFrameChange(
    TimeFrameChanged event,
    Emitter<DetailState> emit,
  ) async {
    try {
      emit(state.copyWith(
        timeFrame: event.timeFrame,
        coinId: state.coinId,
        isLoading: true,
      ));

      await _fetchChart(emit);

    } catch (e) {
      emit(state.copyWith(isLoading: false, error: e.toString()));
    }
  }


  Future<void> _fetchChart(Emitter<DetailState> emit) async {
    try {
      final data = await repository.getCoinChart(
        state.coinId,
        state.timeFrame, // pass timeframe to API
      );

      emit(state.copyWith(
        isLoading: false,
        coins: data.data?.history,
        error: null,
      ));
    } catch (e) {
      emit(state.copyWith(
        isLoading: false,
        error: e.toString(),
      ));
    }
  }

}
