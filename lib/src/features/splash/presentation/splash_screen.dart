import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import 'package:clario_test/src/core/app_routes.dart';
import 'package:clario_test/src/core/form_status_enum.dart';
import 'package:clario_test/src/core/injection_container.dart';
import 'package:clario_test/src/features/splash/bloc/splash_bloc.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => sl<SplashBloc>()..add(const SplashInitEvent()),
      child: const _View(),
    );
  }
}

class _View extends StatelessWidget {
  const _View();

  @override
  Widget build(BuildContext context) {
    return BlocListener<SplashBloc, SplashState>(
      listener: (context, state) {
        if (state.status.isSuccess) {
          context.pushNamed(AppPages.register.name);
        }
      },
      child: const Scaffold(
        body: Center(
          child: Text('Splash'),
        ),
      ),
    );
  }
}
