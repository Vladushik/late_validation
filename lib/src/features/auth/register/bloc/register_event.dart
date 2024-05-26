part of 'register_bloc.dart';

sealed class RegisterEvent extends Equatable {
  const RegisterEvent();
  @override
  List<Object> get props => [];
}

final class RegisterEmailChangedEvent extends RegisterEvent {
  const RegisterEmailChangedEvent(this.email);

  final String email;

  @override
  List<Object> get props => [email];
}

final class RegisterPasswordChangedEvent extends RegisterEvent {
  const RegisterPasswordChangedEvent(this.password);

  final String password;

  @override
  List<Object> get props => [password];
}

final class RegisterSubmittedEvent extends RegisterEvent {
  const RegisterSubmittedEvent();
}
