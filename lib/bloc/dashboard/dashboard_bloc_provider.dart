import 'package:bot_framwork/bloc/dashboard/dashboard_state.dart';
import 'package:rxdart/rxdart.dart';
import 'dart:developer' as d;

class DashboardBloc {
  DashboardState state;
  Stream<DashboardState> _result = Stream.empty();
  Stream<String> _log = Stream.empty();

  ReplaySubject<DashboardChangeRequest> _query =
      ReplaySubject<DashboardChangeRequest>();

  Stream<String> get log => _log;
  Stream<DashboardState> get result => _result;
  Sink<DashboardChangeRequest> get query => _query;

  DashboardBloc({DashboardChangeRequest request}) {
    _result =
        _query.distinct().asyncMap((DashboardChangeRequest request) async {
      return request.state;
    }).asBroadcastStream();

    _result.listen((event) {
      state = event;
    });
  }

  void init(DashboardChangeRequest dashboardChangeRequest) {
    _query.add(dashboardChangeRequest);
  }

  Future<void> changeScreen(int i) async {
    state.currentScreen = i;
    d.log("Screen change to $i");
    _query.add(DashboardChangeRequest(state));
  }
}
