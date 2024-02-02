import 'package:dogapp/pages/add_appointment_page.dart';
import 'package:dogapp/pages/add_comment_page.dart';
import 'package:dogapp/pages/add_dog.dart';
import 'package:dogapp/pages/add_food_page.dart';
import 'package:dogapp/pages/add_num_page.dart';
import 'package:dogapp/pages/add_reminder_page.dart';
import 'package:dogapp/pages/add_training.dart';
import 'package:dogapp/pages/add_walk_page.dart';
import 'package:dogapp/pages/apointment_expert_page.dart';
import 'package:dogapp/pages/appointment_detail_page.dart';
import 'package:dogapp/pages/appointments_page.dart';
import 'package:dogapp/pages/chat_page.dart';
import 'package:dogapp/pages/choose_profile_page.dart';
import 'package:dogapp/pages/community_page.dart';
import 'package:dogapp/pages/create_diet_plan.dart';
import 'package:dogapp/pages/create_foundreport_page.dart';
import 'package:dogapp/pages/create_missreport_page.dart';
import 'package:dogapp/pages/create_time_table.dart';
import 'package:dogapp/pages/day_by_day_ex_page.dart';
import 'package:dogapp/pages/day_view.dart';
import 'package:dogapp/pages/diet_plan_page.dart';
import 'package:dogapp/pages/dog_bait_page.dart';
import 'package:dogapp/pages/dog_detail_page.dart';
import 'package:dogapp/pages/dog_died_page.dart';
import 'package:dogapp/pages/dog_manage_page.dart';
import 'package:dogapp/pages/edit_food_page.dart';
import 'package:dogapp/pages/emergency_case_page.dart';
import 'package:dogapp/pages/emergency_num_page.dart';
import 'package:dogapp/pages/emergency_report_page.dart';
import 'package:dogapp/pages/exercise_details_page.dart';
import 'package:dogapp/pages/expert_dashboard.dart';
import 'package:dogapp/pages/expert_dog_detail_page.dart';
import 'package:dogapp/pages/expert_ex_detail.dart';
import 'package:dogapp/pages/expert_ex_details_page.dart';
import 'package:dogapp/pages/expert_exercise_page.dart';
import 'package:dogapp/pages/expert_feed_manage_page.dart';
import 'package:dogapp/pages/expert_home_page.dart';
import 'package:dogapp/pages/expert_profile.dart';
import 'package:dogapp/pages/expert_signup_page.dart';
import 'package:dogapp/pages/feed_manage_page.dart';
import 'package:dogapp/pages/file_details_page.dart';
import 'package:dogapp/pages/find_training_expert_page.dart';
import 'package:dogapp/pages/found_profile_page.dart';
import 'package:dogapp/pages/founded_dogs_page.dart';
import 'package:dogapp/pages/intro_page.dart';
import 'package:dogapp/pages/language_page.dart';
import 'package:dogapp/pages/list_expert_page.dart';
import 'package:dogapp/pages/login_page.dart';
import 'package:dogapp/pages/make_announcement_page.dart';
import 'package:dogapp/pages/map_page.dart';
import 'package:dogapp/pages/missed_profile_page.dart';
import 'package:dogapp/pages/missing_dogs_page.dart';
import 'package:dogapp/pages/notifications_page.dart';
import 'package:dogapp/pages/parent_dashboard.dart';
import 'package:dogapp/pages/parent_exercise_detail_page.dart';
import 'package:dogapp/pages/parent_exercise_page.dart';
import 'package:dogapp/pages/parent_signup_page.dart';
import 'package:dogapp/pages/patient_files_page.dart';
import 'package:dogapp/pages/reason_page.dart';
import 'package:dogapp/pages/released_report_page.dart';
import 'package:dogapp/pages/released_reports_page.dart';
import 'package:dogapp/pages/report_details_page.dart';
import 'package:dogapp/pages/report_edit_page.dart';
import 'package:dogapp/pages/safety_emergency_page.dart';
import 'package:dogapp/pages/select_breed_page.dart';
import 'package:dogapp/pages/select_expert_page.dart';
import 'package:dogapp/pages/select_report_page.dart';
import 'package:dogapp/pages/signup_page.dart';
import 'package:dogapp/pages/splash_page.dart';
import 'package:dogapp/pages/vaccination_report_page.dart';
import 'package:dogapp/pages/walk_complete_page.dart';
import 'package:dogapp/pages/walk_page.dart';
import 'package:dogapp/pages/walk_record_page.dart';
import 'package:get/get.dart';

import '../pages/edit_dog_page.dart';
import 'route_names.dart';

class AppRoutes {
  static appRoutes() => [
        GetPage(
          name: RouteName.splashPage,
          page: () => const SplashPage(),
          transitionDuration: const Duration(milliseconds: 250),
          transition: Transition.rightToLeft,
        ),
        GetPage(
          name: RouteName.introPage,
          page: () => const IntroPage(),
          transitionDuration: const Duration(milliseconds: 250),
          transition: Transition.rightToLeft,
        ),
        GetPage(
          name: RouteName.chooseProfilePage,
          page: () => const ChooseProfilePage(),
          transitionDuration: const Duration(milliseconds: 250),
          transition: Transition.rightToLeft,
        ),
        GetPage(
          name: RouteName.expertSignupPage,
          page: () => const ExpertSignupPage(),
          transitionDuration: const Duration(milliseconds: 250),
          transition: Transition.rightToLeft,
        ),
        GetPage(
          name: RouteName.parentSignupPage,
          page: () => const ParentSignupPage(),
          transitionDuration: const Duration(milliseconds: 250),
          transition: Transition.rightToLeft,
        ),
        GetPage(
          name: RouteName.parentDashboardPage,
          page: () => const ParentDashboard(),
          transitionDuration: const Duration(milliseconds: 250),
          transition: Transition.rightToLeft,
        ),
        GetPage(
          name: RouteName.appointDetailsPage,
          page: () => const AppointmentDetailPage(),
          transitionDuration: const Duration(milliseconds: 250),
          transition: Transition.rightToLeft,
        ),
        GetPage(
          name: RouteName.dogDetailsPage,
          page: () => const DogDetailsPage(),
          transitionDuration: const Duration(milliseconds: 250),
          transition: Transition.rightToLeft,
        ),
        GetPage(
          name: RouteName.selectReportPage,
          page: () => SelectReportPage(),
          transitionDuration: const Duration(milliseconds: 250),
          transition: Transition.rightToLeft,
        ),
        GetPage(
          name: RouteName.selectExpertPage,
          page: () => const SelectExpertPage(),
          transitionDuration: const Duration(milliseconds: 250),
          transition: Transition.rightToLeft,
        ),
        GetPage(
          name: RouteName.reportDetailsPage,
          page: () => const ReportDetailsPage(),
          transitionDuration: const Duration(milliseconds: 250),
          transition: Transition.rightToLeft,
        ),
        GetPage(
          name: RouteName.listExpertPage,
          page: () => const ListExpertPage(),
          transitionDuration: const Duration(milliseconds: 250),
          transition: Transition.rightToLeft,
        ),
        GetPage(
          name: RouteName.releasedReportPage,
          page: () => const ReleasedReportPage(),
          transitionDuration: const Duration(milliseconds: 250),
          transition: Transition.rightToLeft,
        ),
        GetPage(
          name: RouteName.selectEditReport,
          page: () => SelectReportPage(),
          transitionDuration: const Duration(milliseconds: 250),
          transition: Transition.rightToLeft,
        ),
        GetPage(
          name: RouteName.reportEditPage,
          page: () => const ReportEditPage(),
          transitionDuration: const Duration(milliseconds: 250),
          transition: Transition.rightToLeft,
        ),
        GetPage(
          name: RouteName.expertDashboardPage,
          page: () => const ExpertDashboard(),
          transitionDuration: const Duration(milliseconds: 250),
          transition: Transition.rightToLeft,
        ),
        GetPage(
          name: RouteName.expertHomePage,
          page: () => const ExpertHomePage(),
          transitionDuration: const Duration(milliseconds: 250),
          transition: Transition.rightToLeft,
        ),
        GetPage(
          name: RouteName.appointExpertPage,
          page: () => AppointmentExpertPage(),
          transitionDuration: const Duration(milliseconds: 250),
          transition: Transition.rightToLeft,
        ),
        GetPage(
          name: RouteName.vaccinationReportPage,
          page: () => const VaccinationReportPage(),
          transitionDuration: const Duration(milliseconds: 250),
          transition: Transition.rightToLeft,
        ),
        GetPage(
          name: RouteName.expertdogDetailsPage,
          page: () => const ExpertDogDetailsPage(),
          transitionDuration: const Duration(milliseconds: 250),
          transition: Transition.rightToLeft,
        ),
        GetPage(
          name: RouteName.makeAnnouncementPage,
          page: () => const MakeAnnouncementPage(),
          transitionDuration: const Duration(milliseconds: 250),
          transition: Transition.rightToLeft,
        ),
        GetPage(
          name: RouteName.addCommentsPage,
          page: () => const AddCommentPage(),
          transitionDuration: const Duration(milliseconds: 250),
          transition: Transition.rightToLeft,
        ),
        GetPage(
          name: RouteName.patientFilesPage,
          page: () => const PatientFilesPage(),
          transitionDuration: const Duration(milliseconds: 250),
          transition: Transition.rightToLeft,
        ),
        GetPage(
          name: RouteName.fileDetailsPage,
          page: () => FileDetailsPage(),
          transitionDuration: const Duration(milliseconds: 250),
          transition: Transition.rightToLeft,
        ),
        GetPage(
          name: RouteName.addAppointmentPage,
          page: () => const AddAppointmentPage(),
          transitionDuration: const Duration(milliseconds: 250),
          transition: Transition.rightToLeft,
        ),
        GetPage(
          name: RouteName.languagePage,
          page: () => const SelectLanguagePage(),
          transitionDuration: const Duration(milliseconds: 250),
          transition: Transition.rightToLeft,
        ),
        GetPage(
          name: RouteName.loginPage,
          page: () => const LoginPage(),
          transitionDuration: const Duration(milliseconds: 250),
          transition: Transition.rightToLeft,
        ),
        GetPage(
          name: RouteName.signupPage,
          page: () => const SignupPage(),
          transitionDuration: const Duration(milliseconds: 250),
          transition: Transition.rightToLeft,
        ),
        GetPage(
          name: RouteName.addDogPage,
          page: () => const AddDogPage(),
          transitionDuration: const Duration(milliseconds: 250),
          transition: Transition.rightToLeft,
        ),
        GetPage(
          name: RouteName.addTrainingPage,
          page: () => const AddTrainingPage(),
          transitionDuration: const Duration(milliseconds: 250),
          transition: Transition.rightToLeft,
        ),
        GetPage(
          name: RouteName.expertExercisePage,
          page: () => const ExpertExercisePage(),
          transitionDuration: const Duration(milliseconds: 250),
          transition: Transition.rightToLeft,
        ),
        GetPage(
          name: RouteName.expertExDetailPage,
          page: () => const ExpertExerciseDetails(),
          transitionDuration: const Duration(milliseconds: 250),
          transition: Transition.rightToLeft,
        ),
        GetPage(
          name: RouteName.feedManagePage,
          page: () => const FeedManagePage(),
          transitionDuration: const Duration(milliseconds: 250),
          transition: Transition.rightToLeft,
        ),
        GetPage(
          name: RouteName.addFoodPage,
          page: () => const AddFoodPage(),
          transitionDuration: const Duration(milliseconds: 250),
          transition: Transition.rightToLeft,
        ),
        GetPage(
          name: RouteName.dietPlanPage,
          page: () => const DietPlanPage(),
          transitionDuration: const Duration(milliseconds: 250),
          transition: Transition.rightToLeft,
        ),
        GetPage(
          name: RouteName.expertFeedManagePage,
          page: () => const ExpertFeedPage(),
          transitionDuration: const Duration(milliseconds: 250),
          transition: Transition.rightToLeft,
        ),
        GetPage(
          name: RouteName.createDietPlanPage,
          page: () => const CreateDietPlan(),
          transitionDuration: const Duration(milliseconds: 250),
          transition: Transition.rightToLeft,
        ),
        GetPage(
          name: RouteName.createTimeTable,
          page: () => const CreateTimeTable(),
          transitionDuration: const Duration(milliseconds: 250),
          transition: Transition.rightToLeft,
        ),
        GetPage(
          name: RouteName.safetyEmergencyPage,
          page: () => const SafetyEmergencyPage(),
          transitionDuration: const Duration(milliseconds: 250),
          transition: Transition.rightToLeft,
        ),
        GetPage(
          name: RouteName.emergencyNumPage,
          page: () => const EmergencyNumPage(),
          transitionDuration: const Duration(milliseconds: 250),
          transition: Transition.rightToLeft,
        ),
        GetPage(
          name: RouteName.addNumPage,
          page: () => const AddNumPage(),
          transitionDuration: const Duration(milliseconds: 250),
          transition: Transition.rightToLeft,
        ),
        GetPage(
          name: RouteName.emergencyReportPage,
          page: () => const EmergencyReport(),
          transitionDuration: const Duration(milliseconds: 250),
          transition: Transition.rightToLeft,
        ),
        GetPage(
          name: RouteName.dogBaitPage,
          page: () => const DogBaitPage(),
          transitionDuration: const Duration(milliseconds: 250),
          transition: Transition.rightToLeft,
        ),
        GetPage(
          name: RouteName.mapPage,
          page: () => const MapPage(),
          transitionDuration: const Duration(milliseconds: 250),
          transition: Transition.rightToLeft,
        ),
        GetPage(
          name: RouteName.missingDogsPage,
          page: () => const MissingDogsPage(),
          transitionDuration: const Duration(milliseconds: 250),
          transition: Transition.rightToLeft,
        ),
        GetPage(
          name: RouteName.foundedDogsPage,
          page: () => const FoundedDogsPage(),
          transitionDuration: const Duration(milliseconds: 250),
          transition: Transition.rightToLeft,
        ),
        GetPage(
          name: RouteName.missReportPage,
          page: () => const CreateMissingReport(),
          transitionDuration: const Duration(milliseconds: 250),
          transition: Transition.rightToLeft,
        ),
        GetPage(
          name: RouteName.foundedReportPage,
          page: () => const CreateFoundReport(),
          transitionDuration: const Duration(milliseconds: 250),
          transition: Transition.rightToLeft,
        ),
        GetPage(
          name: RouteName.missDogProfilePage,
          page: () => const MissedProfilePage(),
          transitionDuration: const Duration(milliseconds: 250),
          transition: Transition.rightToLeft,
        ),
        GetPage(
          name: RouteName.foundDogProfilePage,
          page: () => const FoundProfilePage(),
          transitionDuration: const Duration(milliseconds: 250),
          transition: Transition.rightToLeft,
        ),
        GetPage(
          name: RouteName.notificationsPage,
          page: () => const NotificationsPage(),
          transitionDuration: const Duration(milliseconds: 250),
          transition: Transition.rightToLeft,
        ),
        GetPage(
          name: RouteName.dogManagePage,
          page: () => const DogManagementPage(),
          transitionDuration: const Duration(milliseconds: 250),
          transition: Transition.rightToLeft,
        ),
        GetPage(
          name: RouteName.reasonPage,
          page: () => const ReasonPage(),
          transitionDuration: const Duration(milliseconds: 250),
          transition: Transition.rightToLeft,
        ),
        GetPage(
          name: RouteName.dogDiedPage,
          page: () => const DogDiedPage(),
          transitionDuration: const Duration(milliseconds: 250),
          transition: Transition.rightToLeft,
        ),
        GetPage(
          name: RouteName.communityPage,
          page: () => const CommunityPage(),
          transitionDuration: const Duration(milliseconds: 250),
          transition: Transition.rightToLeft,
        ),
        GetPage(
          name: RouteName.chatPage,
          page: () => const ChatPage(),
          transitionDuration: const Duration(milliseconds: 250),
          transition: Transition.rightToLeft,
        ),
        GetPage(
          name: RouteName.addReminder,
          page: () => const AddReminderPage(),
          transitionDuration: const Duration(milliseconds: 250),
          transition: Transition.rightToLeft,
        ),
        GetPage(
          name: RouteName.parentExPage,
          page: () => const ParentExercisePage(),
          transitionDuration: const Duration(milliseconds: 250),
          transition: Transition.rightToLeft,
        ),
        GetPage(
          name: RouteName.walkPage,
          page: () => const WalkPage(),
          transitionDuration: const Duration(milliseconds: 250),
          transition: Transition.rightToLeft,
        ),
        GetPage(
          name: RouteName.walkCompletePage,
          page: () => const WalkCompletePage(),
          transitionDuration: const Duration(milliseconds: 250),
          transition: Transition.rightToLeft,
        ),
        GetPage(
          name: RouteName.walkRecordPage,
          page: () => const WalkRecordPage(),
          transitionDuration: const Duration(milliseconds: 250),
          transition: Transition.rightToLeft,
        ),
        GetPage(
          name: RouteName.addWalkPage,
          page: () => const AddWalkPage(),
          transitionDuration: const Duration(milliseconds: 250),
          transition: Transition.rightToLeft,
        ),
        GetPage(
          name: RouteName.findTrainExpertPage,
          page: () => const FindTrainExpertPage(),
          transitionDuration: const Duration(milliseconds: 250),
          transition: Transition.rightToLeft,
        ),
        GetPage(
          name: RouteName.parentExerciseDetailPage,
          page: () => const ParentExerciseDetail(),
          transitionDuration: const Duration(milliseconds: 250),
          transition: Transition.rightToLeft,
        ),
        GetPage(
          name: RouteName.exerciseDetailPage,
          page: () => const ExerciseDetailPage(),
          transitionDuration: const Duration(milliseconds: 250),
          transition: Transition.rightToLeft,
        ),
        GetPage(
          name: RouteName.expertExDetailsPage,
          page: () => const ExpertExDetailsPage(),
          transitionDuration: const Duration(milliseconds: 250),
          transition: Transition.rightToLeft,
        ),
        GetPage(
          name: RouteName.dayByDayExPage,
          page: () => const DayByDayExPage(),
          transitionDuration: const Duration(milliseconds: 250),
          transition: Transition.rightToLeft,
        ),
        GetPage(
          name: RouteName.releasedReportsPage,
          page: () => const ReleasedReportsPage(),
          transitionDuration: const Duration(milliseconds: 250),
          transition: Transition.rightToLeft,
        ),
        GetPage(
          name: RouteName.appointmentsPage,
          page: () => const AppointmentsPage(),
          transitionDuration: const Duration(milliseconds: 250),
          transition: Transition.rightToLeft,
        ),
        GetPage(
          name: RouteName.expertProfilePage,
          page: () => const ExpertProfilePage(),
          transitionDuration: const Duration(milliseconds: 250),
          transition: Transition.rightToLeft,
        ),
        GetPage(
          name: RouteName.emergencyCasePage,
          page: () => const EmergencyCasePage(),
          transitionDuration: const Duration(milliseconds: 250),
          transition: Transition.rightToLeft,
        ),
        GetPage(
          name: RouteName.selectBreedPage,
          page: () => const SelectBreedPage(),
          transitionDuration: const Duration(milliseconds: 250),
          transition: Transition.rightToLeft,
        ),
        GetPage(
          name: RouteName.editFoodPage,
          page: () => const EditFoodPage(),
          transitionDuration: const Duration(milliseconds: 250),
          transition: Transition.rightToLeft,
        ),
        GetPage(
          name: RouteName.editDogPage,
          page: () => const EditDogPage(),
          transitionDuration: const Duration(milliseconds: 250),
          transition: Transition.rightToLeft,
        ),
        GetPage(
          name: RouteName.dayPage,
          page: () => DayView(),
          transitionDuration: const Duration(milliseconds: 250),
          transition: Transition.rightToLeft,
        ),
      ];
}
