import 'package:go_router/go_router.dart';

import 'package:clario_test/src/features/auth/register/presentation/register_screen.dart';
import 'package:clario_test/src/features/error/presentation/error_screen.dart';
import 'package:clario_test/src/features/splash/presentation/splash_screen.dart';

enum AppPages {
  splash('/'),
  register('/register');

  const AppPages(this.path);
  final String path;
}

sealed class AppRoutes {
  AppRoutes._();

  static final GoRouter router = GoRouter(
    initialLocation: AppPages.splash.path,
    errorBuilder: (_, state) => ErrorScreen(error: state.error?.message),
    routes: [
      GoRoute(
        path: AppPages.splash.path,
        name: AppPages.splash.name,
        builder: (_, __) => const SplashScreen(),
      ),
      GoRoute(
        path: AppPages.register.path,
        name: AppPages.register.name,
        builder: (_, __) => const RegisterScreen(),
      ),
    ],
  );
}
