import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:saunakya_tech/presentation/reusable_widget/small_text.dart';
import 'package:saunakya_tech/utils/constant/colors.dart';
import '../../app/homepage.dart';
import '../../core/global.dart';
import '../../presentation/bloc/app_level_bloc/app_bloc.dart';
import '../../presentation/bloc/timer_bloc/timer_bloc.dart';
import '../../presentation/bloc/user_bloc/user_bloc.dart';
import '../../presentation/pages/profile_page/user_list.dart';
import '../../presentation/pages/timer_count/timer_page.dart';
import 'route_name.dart';

class PageEntity {
  String route;
  Widget page;
  dynamic bloc;
  PageEntity({
    required this.route,
    required this.page,
    required this.bloc,
  });
}

class AppRoutes {
  //Page route
  static List<PageEntity> routes() {
    return [
      PageEntity(
        route: AppRoute.initial,
        page: const AppHomePage(),
        bloc: BlocProvider(create: (_) => ApplicationBloc()),
      ),
      PageEntity(
        route: AppRoute.countdownScreen,
        page: CountdownScreen(),
        bloc: BlocProvider(create: (_) => CountdownBloc()),
      ),
      PageEntity(
        route: AppRoute.userScreen,
        page: const UserListScreen(),
        bloc: BlocProvider(create: (_) => UserBloc()),
      ),
    ];
  }

//all bloc loop through once and get supplied whenever required
  static List<dynamic> allBlocProviders(BuildContext context) {
    List<dynamic> blocProvider = <dynamic>[];
    for (var bloc in routes()) {
      blocProvider.add(bloc.bloc);
    }
    return blocProvider;
  }

  //OnGenerate route, we can check multiple condition here to keep track of user
  static MaterialPageRoute generateRouteSettings(RouteSettings settings) {
    if (settings.name != null) {
      //checkin for routeName matching when navigatorgets triggered

      var pageResult =
          routes().where((element) => element.route == settings.name);
      if (pageResult.isNotEmpty) {
        //checking if the app is booted for the first time or not

        bool deviceFirstOpen = Global.storageService.getDeviceFirstOpen();
        if (pageResult.first.route == AppRoute.initial && deviceFirstOpen) {
          // we can do multiple check condition here,
          //like if the user logged in previously or logged in for the first time

          return MaterialPageRoute(
              builder: (_) => const AppHomePage(), settings: settings);
        }
        return MaterialPageRoute(
            builder: (_) => pageResult.first.page, settings: settings);
      }
    }
    debugPrint("This is Invalid route name: ${settings.name}");
    return MaterialPageRoute(
        builder: (_) => Center(
              child: SmallText(
                text: "Page Not Found",
                color: blueColor,
              ),
            ),
        settings: settings);
  }
}
