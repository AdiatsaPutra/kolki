part of 'page_bloc.dart';

abstract class PageEvent extends Equatable {
  const PageEvent();
}

/*class GoToFirstPage extends PageEvent {
  @override
  List<Object> get props => [];
}*/

class GoToSplashPage extends PageEvent {
  @override
  List<Object> get props => [];
}

class GoToLoginPage extends PageEvent {
  @override
  List<Object> get props => [];
}

class GoToMainPage extends PageEvent {
  @override
  List<Object> get props => [];
}

class GoToRegistrationPage extends PageEvent {
  final RegistrationData registrationData;

  GoToRegistrationPage(this.registrationData);

  @override
  List<Object> get props => [];
}

class GoToPreferencePage extends PageEvent {
  final RegistrationData registrationData;

  GoToPreferencePage(this.registrationData);

  @override
  List<Object> get props => [];
}

class GoToAccountConfirmationPage extends PageEvent {
  final RegistrationData registrationData;

  GoToAccountConfirmationPage(this.registrationData);

  @override
  List<Object> get props => [];
}

class GoToLibraryPage extends PageEvent {
  @override
  List<Object> get props => [];
}

class GoToIlmuDetailPage extends PageEvent {
  @override
  List<Object> get props => [];
}
