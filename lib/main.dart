import 'dart:developer';

import 'package:bot_framwork/bloc/dashboard/dashboard_bloc.dart';
import 'package:bot_framwork/bloc/dashboard/dashboard_bloc_provider.dart';
import 'package:bot_framwork/bloc/dashboard/dashboard_state.dart';
import 'package:flutter/material.dart';

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
      theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
          iconTheme: IconThemeData(color: Colors.white)),
      home: DashboardBlocProvider(
        bloc: DashboardBloc()
          ..init(
              DashboardChangeRequest(DashboardState(currentScreen: 0, screens: [
            DashboardWidgetState(name: "Home", child: HomePage()),
            DashboardWidgetState(name: "Settings", child: SettingsPage())
          ]))),
        child: Dashboard(),
      ),
    );
  }
}

class Dashboard extends StatelessWidget {
  const Dashboard({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var dashCtrl = DashboardBlocProvider.of(context);

    Size ss = MediaQuery.of(context).size;

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
              state.isSliderOpen
                  ? Container(
                      width: ss.width * 1 / 6,
                      color: Colors.blue[100],
                      child: ListView(
                        children: <Widget>[
                          FlatButton(
                              onPressed: () async {
                                log("Change request");
                                await dashCtrl.changeScreen(0);
                              },
                              child: Text("Home")),
                          FlatButton(
                              onPressed: () async {
                                await dashCtrl.changeScreen(1);
                              },
                              child: Text("Settings")),
                        ],
                      ),
                    )
                  : Container(),
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

class HomePage extends StatelessWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text("Home page"),
      ),
    );
  }
}

class SettingsPage extends StatelessWidget {
  const SettingsPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text("Settings page"),
      ),
    );
  }
}
