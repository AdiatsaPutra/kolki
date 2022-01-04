part of 'poin_bloc.dart';

abstract class PoinState extends Equatable {
  const PoinState();

  @override
  List<Object> get props => [];
}

class PoinInitial extends PoinState {}

class PoinValue extends PoinState {
  final int value;
  PoinValue(this.value);
  @override
  List<Object> get props => [value];
}
