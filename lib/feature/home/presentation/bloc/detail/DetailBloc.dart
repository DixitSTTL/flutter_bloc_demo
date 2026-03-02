import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_demo/feature/home/data/models/DetailChartModel.dart';

import '../../../domain/repository/DetailRepository.dart';
import 'DetailEvent.dart';
import 'DetailState.dart';

class DetailBloc extends Bloc<DetailEvent, DetailState> {
  final DetailRepository repository;

  DetailBloc(this.repository) : super(const DetailState()) {
    on<TimeFrameChanged>(_onTimeFrameChange);
    on<CommonDetailFetch>(_onCommonDetailFetch);
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

      final data= await _fetchChart();
      emit(state.copyWith(
        isLoading: false,
        coins: data?.data?.history,
        error: null,
      ));

    } catch (e) {
      emit(state.copyWith(isLoading: false, error: e.toString()));
    }
  }

  Future<void> _onCommonDetailFetch(
      CommonDetailFetch event,
      Emitter<DetailState> emit,
      ) async {
    try {
      emit(state.copyWith(coinId: event.coinId, isLoading: true, isRefresh:event.isRefresh));
      final data = await repository.getCoinCommonDetail(event.coinId);
      final dataCart = await _fetchChart();
      emit(
        state.copyWith(
          isLoading: false,
          coinData: data.data,
          coins: dataCart?.data?.history,
          error: null,
          isRefresh: false,
        ),
      );
    } catch (e) {
      emit(state.copyWith(isLoading: false, error: e.toString(),isRefresh: false));
    }
  }


  Future<DetailChartModel?> _fetchChart() async {
    try {
      final data = await repository.getCoinChart(
        state.coinId,
        state.timeFrame, // pass timeframe to API
      );
      return data;
    } catch (e) {
      return null;
    }
  }

}
