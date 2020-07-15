import 'package:flutter/cupertino.dart';

class DashboardWidgetState {
  String name;
  Widget child;
  DashboardWidgetState({this.name, this.child});
}

class DashboardChangeRequest {
  final DashboardState state;

  DashboardChangeRequest(this.state);
}

class DashboardState {
  int currentScreen;
  bool isSliderOpen = false;
  final List<DashboardWidgetState> screens;
  DashboardState(
      {this.screens = const [],
      this.currentScreen = -1,
      this.isSliderOpen = false});

  DashboardWidgetState activeScreen() {
    return screens[currentScreen];
  }
}
