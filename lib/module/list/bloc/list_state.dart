part of 'list_bloc.dart';

abstract class ListState extends Equatable {}

class ListInitial extends ListState {
  @override
  List<Object?> get props => [];
}

class ListLoading extends ListState {
  @override
  List<Object?> get props => [];
}

class ListLoaded extends ListState {
  ListLoaded({required this.coinsList});

  final List<CoinModel> coinsList;

  @override
  List<Object?> get props => [coinsList];
}

class ListLoadingFailure extends ListState {
  ListLoadingFailure({this.exception});

  final Object? exception;

  @override
  List<Object?> get props => [exception];
}
