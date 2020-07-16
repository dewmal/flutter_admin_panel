import 'dart:developer';

import 'package:bot_framwork/bloc/dashboard/dashboard_bloc.dart';
import 'package:bot_framwork/ui/dashboard/slider_footer_widget.dart';
import 'package:bot_framwork/ui/dashboard/slider_header_widget.dart';
import 'package:flutter/material.dart';

import '../slider_menu_button.dart';

class DashBoardSlider extends StatelessWidget {
  const DashBoardSlider({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var dashCtrl = DashboardBlocProvider.of(context);
    Size ss = MediaQuery.of(context).size;

    var theme = Theme.of(context);

    return Material(
      child: Container(
        width: ss.width * 1 / 6,
        color: Colors.grey[50],
        child: Column(
          children: <Widget>[
            SliderHeaderComponent(),
            SliderMenuButton(
              icon: Icons.home,
              text: "Home",
              isSelected: true,
              onPressed: () async {
                log("Change request");
                await dashCtrl.changeScreen(0);
              },
            ),
            SliderMenuButton(
              icon: Icons.settings,
              text: "Settings",
              onPressed: () async {
                log("Change request");
                await dashCtrl.changeScreen(1);
              },
            ),
            Spacer(),
            SliderFooterComponent()
          ],
        ),
      ),
    );
  }
}
