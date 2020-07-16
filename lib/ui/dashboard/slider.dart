import 'dart:developer';

import 'package:bot_framwork/bloc/dashboard/dashboard_bloc.dart';
import 'package:bot_framwork/ui/dashboard/slider_footer_widget.dart';
import 'package:bot_framwork/ui/dashboard/slider_header_widget.dart';
import 'package:flutter/material.dart';

class DashBoardSlider extends StatelessWidget {
  const DashBoardSlider({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var dashCtrl = DashboardBlocProvider.of(context);

    Size ss = MediaQuery.of(context).size;

    return Material(
      child: Container(
        width: ss.width * 1 / 6,
        color: Colors.red[100],
        child: ListView(
          children: <Widget>[
            SliderHeaderComponent(),
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
            SliderFooterComponent()
          ],
        ),
      ),
    );
  }
}
