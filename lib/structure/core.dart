import 'package:dip_studie/structure/dependency.dart';
import 'package:dip_studie/structure/disposable.dart';
import 'package:dip_studie/structure/inject.dart';
import 'package:flutter/material.dart';

/// Gerencia as dependências de um módulo, permitindo injeção e descarte dinâmico.
class Core {
  final Map<String, dynamic> _injectMapDependency = {};
  final List<Dependency> dependencies;
  final String tag;

  Core({required this.dependencies, required this.tag});

  /// Obtém uma dependência injetada.
  ///
  /// [params] pode ser usado para passar parâmetros adicionais para a injeção.
  /// Retorna uma instância do tipo [T].
  T dependency<T>([Map<String, dynamic>? params]) {
    final typeDependency = T.toString();
    debugPrint(
        'Dependency requested: $typeDependency'); // Log para verificar a dependência solicitada

    if (_injectMapDependency.containsKey(typeDependency)) {
      debugPrint(
          'Dependency found in cache: $typeDependency'); // Log para dependência já registrada
      return _injectMapDependency[typeDependency];
    }

    debugPrint(
        'Dependency not found, creating new instance: $typeDependency'); // Log para dependência nova
    final dependency = dependencies.firstWhere(
      (dep) => dep.inject is T Function(Inject),
      orElse: () => throw Exception("Dependency $typeDependency not found"),
    );

    final instance = dependency.inject(Inject(params: params, tag: tag));
    if (dependency.singleton) {
      debugPrint(
          'Registering singleton dependency: $typeDependency'); // Log para dependência singleton
      _injectMapDependency[typeDependency] = instance;
    }
    return instance;
  }

  /// Remove uma dependência injetada.
  void removeDependency<T>() {
    final type = T.toString();
    if (_injectMapDependency.containsKey(type)) {
      _disposeDependency(type);
    }
  }

  /// Descarta todas as dependências.
  void dispose() {
    final keys = _injectMapDependency.keys.toList();
    for (final key in keys) {
      _disposeDependency(key);
    }
    _injectMapDependency.clear();
  }

  /// Método auxiliar para descartar uma dependência.
  void _disposeDependency(String type) {
    final dependency = _injectMapDependency[type];
    if (dependency is Disposable) dependency.dispose();
    _injectMapDependency.remove(type);
  }
}
