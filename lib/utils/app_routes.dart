// ignore_for_file: constant_identifier_names

import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:get/instance_manager.dart';
import 'package:ki_part/presentation/ui/pages/agency/agency_controller.dart';
import 'package:ki_part/presentation/ui/pages/agency/agency_page.dart';
import 'package:ki_part/presentation/ui/pages/all_agencies/all_agencies_controller.dart';
import 'package:ki_part/presentation/ui/pages/all_agencies/all_agencies_page.dart';
import 'package:ki_part/presentation/ui/pages/home/pick_agency_controller.dart';
import 'package:ki_part/presentation/ui/pages/home/pick_agency_page.dart';
import 'package:ki_part/presentation/ui/pages/home/pick_sub_agency_controller.dart';
import 'package:ki_part/presentation/ui/pages/home/pick_sub_agency_page.dart';
import 'package:ki_part/presentation/ui/pages/login/login_controller.dart';
import 'package:ki_part/presentation/ui/pages/login/login_page.dart';
import 'package:ki_part/presentation/ui/pages/my_tickets/my_tickets_controller.dart';
import 'package:ki_part/presentation/ui/pages/my_tickets/my_tickets_page.dart';
import 'package:ki_part/presentation/ui/pages/notfications/notifications_controller.dart';
import 'package:ki_part/presentation/ui/pages/notfications/notifications_page.dart';
import 'package:ki_part/presentation/ui/pages/password_forgot/forgot_password_controller.dart';
import 'package:ki_part/presentation/ui/pages/password_forgot/password_forgot_page.dart';
import 'package:ki_part/presentation/ui/pages/payment/bank/bank_payment_conteroller.dart';
import 'package:ki_part/presentation/ui/pages/payment/bank/bank_payment_page.dart';
import 'package:ki_part/presentation/ui/pages/payment/operator/operator_payment.dart';
import 'package:ki_part/presentation/ui/pages/payment/operator/operator_payment_controller.dart';
import 'package:ki_part/presentation/ui/pages/payment/payment_page.dart';
import 'package:ki_part/presentation/ui/pages/recap/recap_page.dart';
import 'package:ki_part/presentation/ui/pages/register/register_controller.dart';
import 'package:ki_part/presentation/ui/pages/register/register_page.dart';
import 'package:ki_part/presentation/ui/pages/reset_password/reset_password_controller.dart';
import 'package:ki_part/presentation/ui/pages/reset_password/reset_password_page.dart';
import 'package:ki_part/presentation/ui/pages/search_result/search_result_controller.dart';
import 'package:ki_part/presentation/ui/pages/search_result/search_result_page.dart';
import 'package:ki_part/presentation/ui/pages/search_travel/search_travel_controller.dart';
import 'package:ki_part/presentation/ui/pages/search_travel/search_travel_page.dart';
import 'package:ki_part/presentation/ui/pages/select_place/select_place_page.dart';
import 'package:ki_part/presentation/ui/pages/settings/settings_controller.dart';
import 'package:ki_part/presentation/ui/pages/settings/settings_page.dart';
import 'package:ki_part/presentation/ui/pages/splash/splash_page.dart';
import 'package:ki_part/presentation/ui/pages/travellers_info/travellers_infos_page.dart';
import 'package:ki_part/presentation/ui/pages/travellers_info/travellers_infos_controller.dart';
import 'package:ki_part/presentation/ui/pages/verify_otp/verify_otp_controller.dart';
import 'package:ki_part/presentation/ui/pages/verify_otp/verify_otp_page.dart';
import 'package:ki_part/presentation/ui/pages/recap/recap_controller.dart';
import 'package:ki_part/presentation/ui/pages/ticket/ticket_page.dart';
import 'package:ki_part/presentation/ui/pages/ticket/ticket_controller.dart';
import 'package:ki_part/presentation/ui/pages/chat/chat_page.dart';
import 'package:ki_part/presentation/ui/pages/chat/chat_controller.dart';

mixin Approutes {
  static const HOME = "/";
  static const SPLASH = "/slash";
  static const LOGIN = "/auth/login";
  static const SIGNUP = "/auth/signup";
  static const SEARCH = "/search";
  static const AGENCY = "/agency";
  static const ALL_AGENCIES = "/all/agency";
  static const TICKET = "/ticket";
  static const MY_TICKETS = "/all/tickets";
  static const PASSWORD_FORGOT = "/auth/password-forgot";
  static const PAYMENT = "/pay";
  static const RECAP = "/recap";

  static const RESET_PASSWORD = "/auth/reset-password";
  static const SEARCH_RESULT = "/search-result";
  static const SELECT_PLACE = "/select-place";
  static const TRAVELLERS_INFO = "/travellers-info";
  static const PICK_AGENCY = "/pick-agency";
  static const PICK_SUB_AGENCY = "/pick-sub-agency";
  static const VERIFY_OTP = "/otp";

  static const CHAT = "/chat";
  static const SETTINGS = "/settings";
  static const NOTIFICATIONS = "/settings/notifications";

  static const BANK_PAYMENT = "/payment/bank";
  static const OPERATOR_PAYMENT = "/payment/operator";

  static final pages = [
    GetPage(name: HOME, page: () => const SearchTravelPage()),
    GetPage(name: SPLASH, page: () => const SplashPage()),

    GetPage(
        name: LOGIN,
        page: () => const LoginPage(),
        binding: BindingsBuilder.put(() => LoginController())),
    GetPage(
        name: SIGNUP,
        page: () => const RegisterPage(),
        binding: BindingsBuilder.put(() => RegisterController())),
    GetPage(
        name: SEARCH,
        page: () => const SearchTravelPage(),
        binding: BindingsBuilder.put(() => SearchTravelController())),
    GetPage(
        name: AGENCY,
        page: () => const AgencyDetailsPage(),
        binding: BindingsBuilder.put(() => AgencyController())),
    GetPage(
        name: ALL_AGENCIES,
        page: () => const AllAgenciesPage(),
        binding: BindingsBuilder.put(() => AllAgenciesController())),
    GetPage(
        name: TICKET,
        page: () => const TicketPage(),
        binding: BindingsBuilder.put(() => TicketController())),
    GetPage(
        name: MY_TICKETS,
        page: () => const MyTicketsPage(),
        binding: BindingsBuilder.put(() => MyTicketsController()),
    ),
    GetPage(
      name: PASSWORD_FORGOT,
      binding: BindingsBuilder.put(() => ForgotPasswordController()),
      page: () => const PasswordForgotPage(),
    ),
    GetPage(name: PAYMENT, page: () => const PaymentPage()),
    GetPage(
        name: RECAP,
        binding: BindingsBuilder.put(() => RecapController()),
        page: () => const RecapPage()),
    GetPage(
        name: RESET_PASSWORD,
        binding: BindingsBuilder.put(() => ResetPasswordController()),
        page: () => const ResetPasswordPage()),
    /*GetPage(
        name: SEARCH_RESULT,
        page: () => const SearchResultPage(),
        binding: BindingsBuilder.put(() => SearchResultController())),*/
    GetPage(name: SELECT_PLACE, page: () => const SelectPlacePage()),
    GetPage(
        name: TRAVELLERS_INFO,
        binding: BindingsBuilder.put(() => TravellersInfosController()),
        page: () => const TravellersInfosPage()),
    GetPage(
        name: PICK_AGENCY,
        page: () => const PickAgencyPage(),
        binding: BindingsBuilder.put(() => PickAgencyController())),

    GetPage(
        name: PICK_SUB_AGENCY,
        page: () => const PickSubAgencyPage(),
        binding: BindingsBuilder.put(() => PickSubAgencyController())),

    GetPage(
        name: VERIFY_OTP,
        page: () => const VerifyOTPPage(),
        binding: BindingsBuilder.put(() => VerifyOTPController())),
    GetPage(
        name: SETTINGS,
        page: () => SettingsPage(),
        binding: BindingsBuilder.put(() => SettingsController())),

    GetPage(
        name: CHAT,
        page: () => ChatPage(),
        binding: BindingsBuilder.put(() => ChatController())),

    GetPage(
        name: NOTIFICATIONS,
        page: () => NotificationsPage(),
        binding: BindingsBuilder.put(() => NotificationsController())),
    GetPage(
        name: BANK_PAYMENT,
        page: () => BankPaymentPage(),
        binding: BindingsBuilder.put(() => BankPaymentController())),
    GetPage(
        name: OPERATOR_PAYMENT,
        page: () => OperatorPaymentPage(),
        binding: BindingsBuilder.put(() => OperatorPaymentController()))
  ];
}
