import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:clario_test/src/core/utils/validator.dart';
import 'package:clario_test/src/core/form_status_enum.dart';
import 'package:clario_test/src/core/utils/text_field_status.dart';
import 'package:clario_test/src/features/auth/register/data/repositories/register_repository.dart';

part 'register_event.dart';
part 'register_state.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  RegisterBloc({
    required RegisterRepository repository,
  })  : _repository = repository,
        super(const RegisterState()) {
    on<RegisterEmailChangedEvent>(_onEmailChanged);
    on<RegisterPasswordChangedEvent>(_onPasswordChanged);
    on<RegisterSubmittedEvent>(_onSubmit);
  }

  final RegisterRepository _repository;

  void _onEmailChanged(
    RegisterEmailChangedEvent event,
    Emitter<RegisterState> emit,
  ) {
    final email = event.email;
    emit(state.copyWith(email: email));
  }

  void _onPasswordChanged(
    RegisterPasswordChangedEvent event,
    Emitter<RegisterState> emit,
  ) {
    final password = event.password;
    emit(state.copyWith(password: password));
  }

  Future<void> _onSubmit(
    RegisterSubmittedEvent event,
    Emitter<RegisterState> emit,
  ) async {
    try {
      final bool isEmailValid = Validator.isValidEmail(state.email);
      final bool isPassValid = state.isValidPassword;
      final TextFieldStatus textFieldStatus =
          isEmailValid ? TextFieldStatus.success : TextFieldStatus.failure;
      emit(state.copyWith(textFieldStatus: textFieldStatus));
      if (!isEmailValid || !isPassValid) return;
      emit(state.copyWith(submitStatus: FormStatus.loading));
      await _repository.register();
      emit(state.copyWith(submitStatus: FormStatus.success));
      emit(state.copyWith(submitStatus: FormStatus.initial));
    } catch (e) {
      emit(
        state.copyWith(
          submitStatus: FormStatus.failure,
          errorSubmit: e.toString(),
        ),
      );
    }
  }
}
