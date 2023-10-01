import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:my_app/repositories/coins/coins.dart';
part 'list_event.dart';
part 'list_state.dart';

class ListBloc extends Bloc<ListEvent, ListState> {
  ListBloc(this.coinsRepository) : super(ListInitial()) {
    on<LoadList>((event, emit) async {
      try {
        if (state is!ListLoaded) {
          emit(ListLoading());
        }
        final coinsList = await GetIt.I<AbstractCoinsRepository>().getCoinsList();
        emit(ListLoaded(coinsList: coinsList));
      } catch (e) {
        emit(ListLoadingFailure(exception: e));
      }
      finally {
        event.completer?.complete();
    }
    });
  }

  final AbstractCoinsRepository coinsRepository;
}