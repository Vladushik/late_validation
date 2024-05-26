import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:clario_test/src/core/form_status_enum.dart';
import 'package:clario_test/src/core/injection_container.dart';
import 'package:clario_test/src/core/widgets/buttons/app_button_widget.dart';
import 'package:clario_test/src/core/widgets/text_fields/text_field_widget.dart';
import 'package:clario_test/src/core/widgets/ui_kit/background_widget.dart';
import 'package:clario_test/src/core/widgets/ui_kit/default_padding_widget.dart';
import 'package:clario_test/src/features/auth/register/bloc/register_bloc.dart';
import 'package:clario_test/src/features/auth/register/presentation/widgets/validation_text_widget.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<RegisterBloc>(),
      child: const _View(),
    );
  }
}

class _View extends StatelessWidget {
  const _View();

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return BlocListener<RegisterBloc, RegisterState>(
      listener: (context, state) {
        if (state.submitStatus.isSuccess) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Success')),
          );
        }
        if (state.submitStatus.isFailure) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(state.errorSubmit)),
          );
        }
      },
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: BackgroundWidget(
          child: DefaultPaddingWidget(
            child: Column(
              children: [
                const SizedBox(height: 100),
                Text('Sign up', style: textTheme.titleLarge),
                const SizedBox(height: 32),
                const _EmailFieldWidget(),
                const SizedBox(height: 32),
                const _PasswordFieldWidget(),
                const SizedBox(height: 16),
                const _ValidationText(),
                const SizedBox(height: 56),
                const _Button(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

//MARK: - _EmailFieldWidget
class _EmailFieldWidget extends StatelessWidget {
  const _EmailFieldWidget();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RegisterBloc, RegisterState>(
      builder: (context, state) {
        return TextFieldWidget(
          label: 'Email',
          textFieldStatus: state.textFieldStatus,
          textInputType: TextInputType.emailAddress,
          textInputAction: TextInputAction.next,
          onChanged: (String value) {
            context.read<RegisterBloc>().add(RegisterEmailChangedEvent(value));
          },
        );
      },
    );
  }
}

//MARK: - _PasswordFieldWidget
class _PasswordFieldWidget extends StatelessWidget {
  const _PasswordFieldWidget();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RegisterBloc, RegisterState>(
      builder: (context, state) {
        return TextFieldWidget(
          label: 'Password',
          isPassword: true,
          onChanged: (String value) {
            context
                .read<RegisterBloc>()
                .add(RegisterPasswordChangedEvent(value));
          },
        );
      },
    );
  }
}

//MARK: - _ValidationText
class _ValidationText extends StatelessWidget {
  const _ValidationText();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RegisterBloc, RegisterState>(
      builder: (context, state) {
        return ValidationTextWidget(
          isContainsNumber: state.isContainsNumber,
          isContainsBothRegisters: state.isContainsBothRegisters,
          isCorrectLength: state.isCorrectLength,
          password: state.password,
        );
      },
    );
  }
}

//MARK: - _Button
class _Button extends StatelessWidget {
  const _Button();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RegisterBloc, RegisterState>(
      builder: (context, state) {
        return AppButtonWidget(
          title: 'Sign Up',
          isValid: state.isValid,
          isLoading: state.submitStatus.isLoading,
          onPressed: () {
            context.read<RegisterBloc>().add(const RegisterSubmittedEvent());
          },
        );
      },
    );
  }
}
