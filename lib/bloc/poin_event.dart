part of 'poin_bloc.dart';

abstract class PoinEvent extends Equatable {
  const PoinEvent();

  @override
  List<Object> get props => [];
}

class Incrementt extends PoinEvent {}

class Decrementt extends PoinEvent {}
