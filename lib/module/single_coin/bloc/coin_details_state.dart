part of 'coin_details_bloc.dart';

class CoinDetailsState extends Equatable {
  const CoinDetailsState();

  @override
  List<Object?> get props => [];
}

class CoinDetailsLoading extends CoinDetailsState {
  const CoinDetailsLoading();
}

class CoinDetailsLoaded extends CoinDetailsState {
  const CoinDetailsLoaded(this.coin);

  final CoinModel coin;

  @override
  List<Object?> get props => [coin];
}

class CoinDetailsLoadingFailure extends CoinDetailsState {
  const CoinDetailsLoadingFailure(this.exception);

  final Object exception;

  @override
  List<Object?> get props => super.props..add(exception);
}