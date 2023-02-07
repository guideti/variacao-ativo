import 'package:flutter/material.dart';
import 'package:flutter_module_stockpricechange/redux/app_state.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_test/flutter_test.dart';

import '../factories.dart';

extension TesterExtension on WidgetTester {
  Future<void> pumpMockApp(Widget child, {AppState? state}) async => pumpWidget(
        StoreProvider(
          store: buildStore(state: state),
          child: MaterialApp(
            home: Scaffold(
              body: child,
            ),
          ),
        ),
      );
}
