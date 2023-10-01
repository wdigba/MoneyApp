import 'package:my_app/repositories/coins/coins.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:get_it/get_it.dart';
import 'package:talker/talker.dart';

import '../../../repositories/coins/models/coin_detail.dart';

part 'coin_details_event.dart';
part 'coin_details_state.dart';

class CoinDetailsBloc
    extends Bloc<CoinDetailsEvent, CoinDetailsState> {
  CoinDetailsBloc(this.coinsRepository)
      : super(const CoinDetailsState()) {
    on<LoadCoinDetails>(load);
  }

  final AbstractCoinsRepository coinsRepository;

  Future<void> load(
      LoadCoinDetails event,
      Emitter<CoinDetailsState> emit,
      ) async {
    try {
      if (state is! CoinDetailsLoaded) {
        emit(const CoinDetailsLoading());
      }

      final coinDetails =  await coinsRepository.getCoinDetails(event.currencyCode);

      emit(CoinDetailsLoaded(coinDetails));
    } catch (e) {
      emit(CoinDetailsLoadingFailure(e));
    }
  }

  @override
  void onError(Object error, StackTrace stackTrace) {
    super.onError(error, stackTrace);
    GetIt.I<Talker>().handle(error, stackTrace);
  }
}