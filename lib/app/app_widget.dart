import 'package:dip_studie/app/app_module.dart';
import 'package:dip_studie/app/navigator_util.dart';
import 'package:dip_studie/app/router.dart';
import 'package:dip_studie/home/home_module.dart';
import 'package:flutter/material.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      navigatorKey: AppModule.to.get<NavigatorUtil>().navigatorKey,
      onGenerateRoute: AppRouter.generateRoute,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: getModuleInit(),
    );
  }
}

// void goToParametersPage() {
//   AppModule.to
//       .get<NavigatorUtil>()
//       .navigateTo(RouterPathsConstants.nameRoute);
// }

getModuleInit() {
  return const HomeModule();
}
