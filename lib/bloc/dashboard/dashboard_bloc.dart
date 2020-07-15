import 'package:bot_framwork/bloc/dashboard/dashboard_bloc_provider.dart';
import 'package:flutter/cupertino.dart';

class DashboardBlocProvider extends InheritedWidget {
  final DashboardBloc bloc;

  DashboardBlocProvider({Key key, DashboardBloc bloc, Widget child})
      : this.bloc = bloc ?? DashboardBloc(),
        super(child: child, key: key);

  static DashboardBloc of(BuildContext context) =>
      (context.dependOnInheritedWidgetOfExactType<DashboardBlocProvider>())
          .bloc;

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) => true;
}
