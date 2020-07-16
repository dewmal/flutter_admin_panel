import 'package:bot_framwork/bloc/dashboard/dashboard_bloc.dart';
import 'package:bot_framwork/bloc/dashboard/dashboard_bloc_provider.dart';
import 'package:bot_framwork/bloc/dashboard/dashboard_state.dart';
import 'package:bot_framwork/theme/theme.dart';
import 'package:flutter/material.dart';

import 'screen/dashboard_screen.dart';
import 'screen/pages/home_screen.dart';
import 'screen/pages/settings_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Ceylon App bots',
      theme: themeData,
      home: DashboardBlocProvider(
        bloc: DashboardBloc()
          ..init(DashboardChangeRequest(DashboardState(
              currentScreen: 0,
              screens: [
                DashboardWidgetState(name: "Home", child: HomePage()),
                DashboardWidgetState(name: "Settings", child: SettingsPage())
              ],
              isSliderOpen: true))),
        child: Dashboard(),
      ),
    );
  }
}
