enum AppFlavor {
  production,
  dev,
}

class AppEnvironment {
  static AppEnvironment instance = AppEnvironment._();

  AppEnvironment._();

  AppFlavor _flavor = AppFlavor.dev;

  AppFlavor get flavor => _flavor;

  void enableProduction() {
    _flavor = AppFlavor.production;
  }

  void enableDev() {
    _flavor = AppFlavor.dev;
  }
}
