import 'package:dogapp/pages/add_appointment_page.dart';
import 'package:dogapp/pages/add_comment_page.dart';
import 'package:dogapp/pages/apointment_expert_page.dart';
import 'package:dogapp/pages/appointment_detail_page.dart';
import 'package:dogapp/pages/choose_profile_page.dart';
import 'package:dogapp/pages/dog_detail_page.dart';
import 'package:dogapp/pages/expert_dashboard.dart';
import 'package:dogapp/pages/expert_dog_detail_page.dart';
import 'package:dogapp/pages/expert_home_page.dart';
import 'package:dogapp/pages/expert_signup_page.dart';
import 'package:dogapp/pages/file_details_page.dart';
import 'package:dogapp/pages/intro_page.dart';
import 'package:dogapp/pages/list_expert_page.dart';
import 'package:dogapp/pages/make_announcement_page.dart';
import 'package:dogapp/pages/parent_dashboard.dart';
import 'package:dogapp/pages/parent_signup_page.dart';
import 'package:dogapp/pages/patient_files_page.dart';
import 'package:dogapp/pages/released_report_page.dart';
import 'package:dogapp/pages/report_details_page.dart';
import 'package:dogapp/pages/report_edit_page.dart';
import 'package:dogapp/pages/select_expert_page.dart';
import 'package:dogapp/pages/select_report_page.dart';
import 'package:dogapp/pages/splash_page.dart';
import 'package:dogapp/pages/vaccination_report_page.dart';
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
        GetPage(
          name: RouteName.parentDashboardPage,
          page: () => const ParentDashboard(),
          transitionDuration: const Duration(milliseconds: 250),
          transition: Transition.leftToRight,
        ),
        GetPage(
          name: RouteName.appointDetailsPage,
          page: () => const AppointmentDetailPage(),
          transitionDuration: const Duration(milliseconds: 250),
          transition: Transition.leftToRight,
        ),
        GetPage(
          name: RouteName.dogDetailsPage,
          page: () => const DogDetailsPage(),
          transitionDuration: const Duration(milliseconds: 250),
          transition: Transition.leftToRight,
        ),
        GetPage(
          name: RouteName.selectReportPage,
          page: () => SelectReportPage(),
          transitionDuration: const Duration(milliseconds: 250),
          transition: Transition.leftToRight,
        ),
        GetPage(
          name: RouteName.selectExpertPage,
          page: () => const SelectExpertPage(),
          transitionDuration: const Duration(milliseconds: 250),
          transition: Transition.leftToRight,
        ),
        GetPage(
          name: RouteName.reportDetailsPage,
          page: () => const ReportDetailsPage(),
          transitionDuration: const Duration(milliseconds: 250),
          transition: Transition.leftToRight,
        ),
        GetPage(
          name: RouteName.listExpertPage,
          page: () => const ListExpertPage(),
          transitionDuration: const Duration(milliseconds: 250),
          transition: Transition.leftToRight,
        ),
        GetPage(
          name: RouteName.releasedReportPage,
          page: () => const ReleasedReportPage(),
          transitionDuration: const Duration(milliseconds: 250),
          transition: Transition.leftToRight,
        ),
        GetPage(
          name: RouteName.selectEditReport,
          page: () => SelectReportPage(),
          transitionDuration: const Duration(milliseconds: 250),
          transition: Transition.leftToRight,
        ),
        GetPage(
          name: RouteName.reportEditPage,
          page: () => const ReportEditPage(),
          transitionDuration: const Duration(milliseconds: 250),
          transition: Transition.leftToRight,
        ),
        GetPage(
          name: RouteName.expertDashboardPage,
          page: () => const ExpertDashboard(),
          transitionDuration: const Duration(milliseconds: 250),
          transition: Transition.leftToRight,
        ),
        GetPage(
          name: RouteName.expertHomePage,
          page: () => const ExpertHomePage(),
          transitionDuration: const Duration(milliseconds: 250),
          transition: Transition.leftToRight,
        ),
        GetPage(
          name: RouteName.appointExpertPage,
          page: () => AppointmentExpertPage(),
          transitionDuration: const Duration(milliseconds: 250),
          transition: Transition.leftToRight,
        ),
        GetPage(
          name: RouteName.vaccinationReportPage,
          page: () => const VaccinationReportPage(),
          transitionDuration: const Duration(milliseconds: 250),
          transition: Transition.leftToRight,
        ),
        GetPage(
          name: RouteName.expertdogDetailsPage,
          page: () => const ExpertDogDetailsPage(),
          transitionDuration: const Duration(milliseconds: 250),
          transition: Transition.leftToRight,
        ),
        GetPage(
          name: RouteName.makeAnnouncementPage,
          page: () => const MakeAnnouncementPage(),
          transitionDuration: const Duration(milliseconds: 250),
          transition: Transition.leftToRight,
        ),
        GetPage(
          name: RouteName.addCommentsPage,
          page: () => const AddCommentPage(),
          transitionDuration: const Duration(milliseconds: 250),
          transition: Transition.leftToRight,
        ),
        GetPage(
          name: RouteName.patientFilesPage,
          page: () => const PatientFilesPage(),
          transitionDuration: const Duration(milliseconds: 250),
          transition: Transition.leftToRight,
        ),
        GetPage(
          name: RouteName.fileDetailsPage,
          page: () => const FileDetailsPage(),
          transitionDuration: const Duration(milliseconds: 250),
          transition: Transition.leftToRight,
        ),
        GetPage(
          name: RouteName.addAppointmentPage,
          page: () => const AddAppointmentPage(),
          transitionDuration: const Duration(milliseconds: 250),
          transition: Transition.leftToRight,
        ),
      ];
}
