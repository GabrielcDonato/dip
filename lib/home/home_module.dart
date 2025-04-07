import 'package:dip_studie/home/home_page.dart';
import 'package:dip_studie/structure/structure.dart';
import 'package:flutter/material.dart';

class HomeModule extends ModuleWidget {
  const HomeModule({super.key});

  @override
  Widget buildView(BuildContext context) {
    return const HomePage(
      title: 'Home',
    );
  }

  static Inject get to => Inject<HomeModule>.of();

  @override
  List<Dependency> get dependencies => [
        Dependency<Repository>(
          (i) => LocalRepositoryImpl(),
        ),
      ];
}

abstract interface class Repository {
  void doSomething() {
    // Implementation of Repository
  }
}

class LocalRepositoryImpl implements Repository {
  @override
  void doSomething() {
    // Implementation of Repository
  }
}

//Testar para ver se o Repository é injetado corretamente quando ambos são tipados com a mesma interface
//Implementar registro por instance_name

class RemoteRepositoryImpl implements Repository {
  @override
  void doSomething() {
    // Implementation of Service
  }
}
