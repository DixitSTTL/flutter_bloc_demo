import 'package:equatable/equatable.dart';

abstract class HomeEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class CoinListRequested extends HomeEvent {
  CoinListRequested();

  @override
  List<Object?> get props => [];
}
