import 'package:bwt_assignment/screens/homeScreen.dart';
import 'package:bwt_assignment/screens/loginPage.dart';
import 'package:bwt_assignment/screens/registerPage.dart';
import 'package:get/get.dart';

class Routes {
  static String registerPage = "/registerPage";
  static String loginPage = "/loginPage";
  static String homePage = "/homePage";
}

final pages = [
  GetPage(name: Routes.registerPage, page: () => const RegisterPage()),
  GetPage(name: Routes.homePage, page: () => const homeScreen())
];
