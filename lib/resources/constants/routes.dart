import 'package:calculator/screens/main_screen_vu.dart';
import 'package:calculator/screens/views/basic_calc/basic_calc_vu.dart';
import 'package:get/get.dart';

appRoutes() => [
      GetPage(
        name: '/add',
        page: () => const BasicClacView(),
        transition: Transition.fadeIn,
        transitionDuration: const Duration(milliseconds: 500),
      ),
      GetPage(
        name: '/main-screen',
        page: () => const MainScreenView(),
        middlewares: [MyMiddelware()],
        transition: Transition.fadeIn,
        transitionDuration: const Duration(milliseconds: 300),
      ),
      // GetPage(
      //   name: '/main',
      //   page: () => const PageBuilderView(),
      //   middlewares: [MyMiddelware()],
      //   transition: Transition.fadeIn,
      //   transitionDuration: const Duration(milliseconds: 500),
      // ),
      // GetPage(
      //   name: '/signup',
      //   page: () => const SignupView(),
      //   middlewares: [MyMiddelware()],
      //   transition: Transition.fadeIn,
      //   transitionDuration: const Duration(milliseconds: 300),
      // ),
      // GetPage(
      //   name: '/attendance',
      //   page: () => const AttendanceView(),
      //   middlewares: [MyMiddelware()],
      //   transition: Transition.fadeIn,
      //   transitionDuration: const Duration(milliseconds: 500),
      // ),
      // GetPage(
      //   name: '/leaves',
      //   page: () => const LeavesView(),
      //   middlewares: [MyMiddelware()],
      //   transition: Transition.fadeIn,
      //   transitionDuration: const Duration(milliseconds: 500),
      // ),
      // GetPage(
      //   name: '/leaves_request',
      //   page: () => const CreateLeaveRequestView(),
      //   middlewares: [MyMiddelware()],
      //   transition: Transition.fadeIn,
      //   transitionDuration: const Duration(milliseconds: 500),
      // ),
      // GetPage(
      //   name: '/tasks',
      //   page: () => const TasksView(),
      //   middlewares: [MyMiddelware()],
      //   transition: Transition.fadeIn,
      //   transitionDuration: const Duration(milliseconds: 500),
      // ),
      // GetPage(
      //   name: '/others',
      //   page: () => const OthersView(),
      //   middlewares: [MyMiddelware()],
      //   transition: Transition.fadeIn,
      //   transitionDuration: const Duration(milliseconds: 500),
      // ),
    ];

class MyMiddelware extends GetMiddleware {
  @override
  GetPage? onPageCalled(GetPage? page) {
    print(page?.name);
    return super.onPageCalled(page);
  }
}
