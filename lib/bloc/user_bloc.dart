import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:kolki/models/models.dart';
import 'package:kolki/services/services.dart';
import 'package:equatable/equatable.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  UserBloc() : super(UserInitial());
  @override
  Stream<UserState> mapEventToState(
    UserEvent event,
  ) async* {
    if (event is LoadUser) {
      User user = await UserServices.getUser(event.id);
      yield UserLoaded(user);
    } else if (event is SignOut) {
      yield UserInitial();
    } else if (event is UpdateData) {
      User updatedUser = (state as UserLoaded).user.copyWith(
            name: event.name,
            profilePicture: event.profileImage,
          );
      await UserServices.updateUser(updatedUser);
      yield UserLoaded(updatedUser);
    } else if (event is Increment) {
      User poinUp = (state as UserLoaded).user.copyWith(
            balance: (state as UserLoaded).user.balance + 10,
          );
      await UserServices.updateUser(poinUp);
      yield UserLoaded(poinUp);
    } else if (event is Decrement) {
      User poinDown = (state as UserLoaded).user.copyWith(
            balance: (state as UserLoaded).user.balance - 30,
          );
      await UserServices.updateUser(poinDown);
      yield UserLoaded(poinDown);
    }
  }
}
