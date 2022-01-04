import 'dart:async';

import 'package:bloc/bloc.dart';

import 'package:equatable/equatable.dart';

part 'poin_event.dart';
part 'poin_state.dart';

class PoinBloc extends Bloc<PoinEvent, PoinState> {
  PoinBloc() : super(PoinInitial());

  @override
  Stream<PoinState> mapEventToState(
    PoinEvent event,
  ) async* {
    if (event is Incrementt) {
      if (state is PoinInitial) {
        yield (PoinValue(0));
      } else {
        yield PoinValue((state as PoinValue).value + 1);
      }
    }
  }
}
