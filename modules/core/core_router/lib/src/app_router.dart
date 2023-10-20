import 'package:core_dependency/core_dependency.dart';
import 'package:flutter/material.dart';

abstract class AppRouterBehavior {
  Future<dynamic> push(String routeName, {dynamic arguments});

  Future<dynamic> pushAndRemoveUntil(
    String routeName, {
    String? routeEnd,
    dynamic arguments,
  });

  void pop();

  void popToPath(String path);

  Future modalBottomPage(
    Widget page, {
    bool? enableDrag,
    bool? isDismissible,
    RouteSettings? setting,
    Color? barrierColor,
  });
}

abstract class AppRouter implements AppRouterBehavior {
  GlobalKey<NavigatorState> get navigatorKey;

  void setContext(BuildContext context);

  BuildContext get rootContext;
}

class AppRouterImpl extends AppRouter {
  late BuildContext _rootContext;

  @override
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  bool _canPop() {
    final context = navigatorKey.currentContext;
    if (context == null) return false;
    final canPop = Navigator.canPop(context);
    return canPop;
  }

  @override
  void pop() {
    final state = navigatorKey.currentState;
    if (state == null) return;
    if (_canPop()) state.pop();
  }

  @override
  void popToPath(String path) {
    final state = navigatorKey.currentState;
    if (state == null) return;
    state.popUntil(ModalRoute.withName(path));
  }

  @override
  Future push(String routeName, {arguments}) {
    final state = navigatorKey.currentState;
    if (state == null) return Future(() => null);
    return state.pushNamed(routeName, arguments: arguments);
  }

  @override
  Future pushAndRemoveUntil(String routeName, {String? routeEnd, arguments}) {
    final state = navigatorKey.currentState;
    if (state == null) return Future(() => null);
    return state.pushNamedAndRemoveUntil(
      routeName,
      routeEnd == null ? (route) => false : ModalRoute.withName(routeEnd),
      arguments: arguments,
    );
  }

  @override
  Future modalBottomPage(
    Widget page, {
    bool? enableDrag,
    bool? isDismissible,
    RouteSettings? setting,
    Color? barrierColor,
  }) {
    return showMaterialModalBottomSheet(
      settings: setting,
      context: navigatorKey.currentState!.context,
      builder: (context) => page,
      duration: const Duration(milliseconds: 300),
      backgroundColor: Colors.white,
      barrierColor: barrierColor ?? const Color(0xff020202).withOpacity(0.54),
      enableDrag: enableDrag ?? true,
      isDismissible: isDismissible ?? true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(20.0),
        ),
      ),
      clipBehavior: Clip.antiAliasWithSaveLayer,
    );
  }

  @override
  void setContext(BuildContext context) {
    _rootContext = context;
  }

  @override
  BuildContext get rootContext => _rootContext;
}
