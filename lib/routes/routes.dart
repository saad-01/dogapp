
import 'package:dogapp/pages/splash_page.dart';
import 'package:get/get.dart';

import 'route_names.dart';

class AppRoutes {
  static appRoutes() => [
        GetPage(
          name: RouteName.splashScreen,
          page: () => const SplashPage(),
          transitionDuration: const Duration(milliseconds: 250),
          transition: Transition.leftToRight,
        ),
      ];
}
