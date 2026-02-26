import 'package:equatable/equatable.dart';

import '../../../data/models/HomeCoinModel.dart';

class HomeState extends Equatable {
  final bool isLoading;
  final List<Coins> coins;
  final String? error;

  const HomeState({
    this.isLoading = false,
    this.coins = const [], // 👈 default empty list
    this.error,
  });

  HomeState copyWith({bool? isLoading, List<Coins>? coins, String? error}) {
    return HomeState(
      isLoading: isLoading ?? this.isLoading,
      coins: coins ?? this.coins,
      error: error,
    );
  }

  @override
  List<Object?> get props => [isLoading, coins, error];
}
