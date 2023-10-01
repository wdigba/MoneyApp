part of 'coin_details_bloc.dart';

abstract class CoinDetailsEvent extends Equatable {
  const CoinDetailsEvent();

  @override
  List<Object> get props => [];
}

class LoadCoinDetails extends CoinDetailsEvent {
  const LoadCoinDetails({
    required this.currencyCode,
  });

  final String currencyCode;

  @override
  List<Object> get props => super.props..add(currencyCode);
}