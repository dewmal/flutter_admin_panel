import 'dart:developer';

import 'package:bot_framwork/bloc/dashboard/dashboard_bloc.dart';
import 'package:bot_framwork/bloc/dashboard/dashboard_state.dart';
import 'package:bot_framwork/ui/dashboard/slider.dart';
import 'package:flutter/material.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var dashCtrl = DashboardBlocProvider.of(context);

    return StreamBuilder<DashboardState>(
        stream: dashCtrl.result,
        builder: (context, snapshot) {
          if (snapshot.data == null || snapshot.error != null) {
            log("No loading...");
            log("Error ${snapshot.error}");
            return Container(
              child: Center(
                child: CircularProgressIndicator(),
              ),
            );
          }
          DashboardState state = snapshot.data;
          DashboardWidgetState activeScreen = state.activeScreen();

          return Row(
            children: <Widget>[
              state.isSliderOpen ? DashBoardSlider() : Container(),
              Expanded(
                  child: Scaffold(
                appBar: AppBar(
                  title: Text("${activeScreen.name}"),
                  leading: FlatButton(
                      onPressed: () {
                        dashCtrl.toggleSlider();
                      },
                      child: Icon(Icons.menu)),
                ),
                body: activeScreen.child,
              ))
            ],
          );
        });
  }
}
