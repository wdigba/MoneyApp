part of 'list_bloc.dart';

class ListState {}

class ListInitial extends ListState {}

class ListLoading extends ListState {}

class ListLoaded extends ListState {
  ListLoaded({
    required this.coinsList
  });

  final List<CoinModel> coinsList;
}

class ListLoadingFailure extends ListState {
  ListLoadingFailure({
    this.exception
  });
  final Object? exception;
}