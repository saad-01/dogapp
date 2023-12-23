
import 'package:dogapp/pages/choose_profile_page.dart';
import 'package:dogapp/pages/expert_signup_page.dart';
import 'package:dogapp/pages/intro_page.dart';
import 'package:dogapp/pages/parent_signup_page.dart';
import 'package:dogapp/pages/splash_page.dart';
import 'package:get/get.dart';

import 'route_names.dart';

class AppRoutes {
  static appRoutes() => [
        GetPage(
          name: RouteName.splashPage,
          page: () => const SplashPage(),
          transitionDuration: const Duration(milliseconds: 250),
          transition: Transition.leftToRight,
        ),
        GetPage(
          name: RouteName.introPage,
          page: () => const IntroPage(),
          transitionDuration: const Duration(milliseconds: 250),
          transition: Transition.leftToRight,
        ),
        GetPage(
          name: RouteName.chooseProfilePage,
          page: () => const ChooseProfilePage(),
          transitionDuration: const Duration(milliseconds: 250),
          transition: Transition.leftToRight,
        ),
        GetPage(
          name: RouteName.expertSignupPage,
          page: () => const ExpertSignupPage(),
          transitionDuration: const Duration(milliseconds: 250),
          transition: Transition.leftToRight,
        ),
        GetPage(
          name: RouteName.parentSignupPage,
          page: () => const ParentSignupPage(),
          transitionDuration: const Duration(milliseconds: 250),
          transition: Transition.leftToRight,
        ),
      ];
}
