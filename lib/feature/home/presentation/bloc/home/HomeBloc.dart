import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/repository/HomeRepository.dart';
import 'HomeEvent.dart';
import 'HomeState.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final HomeRepository repository;

  HomeBloc(this.repository) : super(const HomeState()) {
    on<CoinListRequested>(_onGetAllCoins);
  }

  FutureOr<void> _onGetAllCoins(
    CoinListRequested event,
    Emitter<HomeState> emit,
  ) async {
    debugPrint(event.props.toString());
    try {
      final data = await repository.getAllHomeCoins();
      emit(state.copyWith(isLoading: false, coins: data.data?.coins));
    } catch (e) {
      emit(state.copyWith(isLoading: false, error: e.toString()));
    }
  }
}
