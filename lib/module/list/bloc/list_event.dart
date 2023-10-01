part of 'list_bloc.dart';

abstract class ListEvent extends Equatable {}

class LoadList extends ListEvent {
  LoadList({
    this.completer,
  });
  final Completer? completer;

  @override
  List<Object?> get props => [completer];
}