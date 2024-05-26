abstract interface class RegisterRepository {
  Future<void> register();
}

class RegisterRepositoryImpl implements RegisterRepository {
  @override
  Future<void> register() async {
    await Future.delayed(const Duration(seconds: 2));
  }
}
