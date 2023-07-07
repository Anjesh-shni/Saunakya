import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../presentation/bloc/app_level_bloc/app_bloc.dart';
import '../presentation/bloc/app_level_bloc/app_event.dart';
import '../presentation/bloc/app_level_bloc/app_state.dart';
import 'widget.dart';

class AppHomePage extends StatefulWidget {
  const AppHomePage({super.key});

  @override
  State<AppHomePage> createState() => _AppHomePageState();
}

class _AppHomePageState extends State<AppHomePage> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ApplicationBloc, ApplicationState>(
        builder: (context, state) {
      return Container(
        color: Colors.grey,
        child: SafeArea(
          child: Scaffold(
            body: buildPage(state.index),
            bottomNavigationBar: Container(
              color: Colors.grey,
              child: BottomNavigationBar(
                onTap: (value) {
                  context.read<ApplicationBloc>().add(TriggerAppEvent(value));
                },
                type: BottomNavigationBarType.fixed,
                currentIndex: state.index,
                elevation: 0,
                selectedItemColor: Colors.green,
                unselectedItemColor: Colors.grey,
                selectedFontSize: 12,
                unselectedFontSize: 10,
                items: bottomTab,
              ),
            ),
          ),
        ),
      );
    });
  }
}
