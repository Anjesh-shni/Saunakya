import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'config/bloc_route/route.dart';
import 'core/global.dart';
import 'utils/constant/colors.dart';

void main() async {
  await Global.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    debugPrint("=======APP STARTED=======");
    return MultiBlocProvider(
      providers: [...AppRoutes.allBlocProviders(context)],
      child: MaterialApp(
        title: 'Susankya task',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          scaffoldBackgroundColor: primaryColor,
          appBarTheme: const AppBarTheme(
            color: primaryColor,
          ),
        ),
        onGenerateRoute: AppRoutes.generateRouteSettings,
      ),
    );
  }
}
