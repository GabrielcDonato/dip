import 'package:flutter/material.dart';

class NavigatorUtil {
  final _navigatorKey = GlobalKey<NavigatorState>();
  GlobalKey<NavigatorState> get navigatorKey => _navigatorKey;

  Future navigateTo(String routeName, {dynamic arguments}) {
    return _navigatorKey.currentState!
        .pushNamed(routeName, arguments: arguments);
  }

  Future navigateToAndReplacement(String routeName, {dynamic arguments}) {
    return _navigatorKey.currentState!
        .pushReplacementNamed(routeName, arguments: arguments);
  }

  Future navigateToAndSetTheStackRoot(String routeName, {dynamic arguments}) {
    return _navigatorKey.currentState!
        .pushNamedAndRemoveUntil(routeName, (p) => false, arguments: arguments);
  }

  goBack() {
    return _navigatorKey.currentState!.pop();
  }

  goBackWithData([result]) {
    return _navigatorKey.currentState!.pop(result);
  }

  goBackUntil(String routeName) {
    return _navigatorKey.currentState!.popUntil(ModalRoute.withName(routeName));
  }

  bool isCurrentPage(BuildContext? context) {
    return context != null && (ModalRoute.of(context)?.isCurrent ?? false);
  }
}
