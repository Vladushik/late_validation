part of 'register_bloc.dart';

class RegisterState extends Equatable {
  const RegisterState({
    this.submitStatus = FormStatus.initial,
    this.password = '',
    this.email = '',
    this.errorSubmit = '',
    this.textFieldStatus = TextFieldStatus.initial,
  });

  final FormStatus submitStatus;
  final String password;
  final String email;
  final String errorSubmit;
  final TextFieldStatus textFieldStatus;

  bool get isValid =>
      isContainsNumber &&
      isCorrectLength &&
      isContainsBothRegisters &&
      email.isNotEmpty;
  bool get isValidPassword =>
      isContainsNumber && isCorrectLength && isContainsBothRegisters;
  bool get isContainsNumber => Validator.isContainsNumber(password);
  bool get isCorrectLength => Validator.isCorrectLength(password);
  bool get isContainsBothRegisters =>
      Validator.isContainsBothRegisters(password);

  RegisterState copyWith({
    FormStatus? submitStatus,
    String? password,
    String? email,
    String? errorSubmit,
    TextFieldStatus? textFieldStatus,
  }) {
    return RegisterState(
      submitStatus: submitStatus ?? this.submitStatus,
      password: password ?? this.password,
      email: email ?? this.email,
      errorSubmit: errorSubmit ?? this.errorSubmit,
      textFieldStatus: textFieldStatus ?? this.textFieldStatus,
    );
  }

  @override
  List<Object?> get props => [
        submitStatus,
        email,
        password,
        errorSubmit,
        textFieldStatus,
      ];
}
