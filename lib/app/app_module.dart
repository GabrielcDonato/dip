import 'package:dip_studie/app/app_widget.dart';
import 'package:dip_studie/app/navigator_util.dart';
import 'package:dip_studie/structure/structure.dart';
import 'package:flutter/material.dart';

class AppModule extends ModuleWidget {
  const AppModule({super.key});

  @override
  Widget buildView(BuildContext context) {
    return const AppWidget();
  }

  static Inject get to => Inject<AppModule>.of();

  @override
  List<Dependency> get dependencies => [
        Dependency((i) => NavigatorUtil()),
        Dependency<Service>(
          (i) => LocalServiceImpl(),
        ),
      ];
}

abstract interface class Service {
  void doSomething() {
    // Implementation of Service
  }
}

class LocalServiceImpl implements Service {
  @override
  void doSomething() {
    // Implementation of Service
  }
}

//Testar para ver se o Service é injetado corretamente quando ambos são tipados com a mesma interface
//Implementar registro por instance_name

class RemoteServiceImpl implements Service {
  @override
  void doSomething() {
    // Implementation of Service
  }
}
