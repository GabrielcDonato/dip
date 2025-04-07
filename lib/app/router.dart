import 'package:dip_studie/home/home_module.dart';
import 'package:flutter/material.dart';

abstract class AppRouter {
  static final Map<String, Route Function(RouteSettings settings)> routes = {
    'homeModule': (RouteSettings settings) => _getPage(
          const HomeModule(),
          settings,
        ),
  };
  static Route generateRoute(RouteSettings settings) {
    Route Function(RouteSettings)? router = routes[settings.name];

    return (router != null)
        ? router(settings)
        : MaterialPageRoute(
            builder: (context) => Scaffold(
              body: Center(
                child: Text('Nenhuma rota encontrada para ${settings.name}'),
              ),
            ),
          );
  }

  static Route _getPage(
    Widget widget,
    RouteSettings settings,
  ) {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) {
        return widget;
      },
      settings: settings,
    );
  }
}
