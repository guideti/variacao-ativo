import 'package:flutter/material.dart';
import 'package:flutter_module_stockpricechange/chart/chart_view.dart';
import 'package:flutter_module_stockpricechange/pigeon.dart';
import 'package:flutter_module_stockpricechange/redux/app_state.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sp_design_system/sp_design_system.dart';

import 'table/table_view.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final NativeNavigationApi api = NativeNavigationApi();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: IconButton(
            // TODO(lucas): Use constants for assets
            icon: SvgPicture.asset(
              'assets/back_icon.svg',
              colorFilter: ColorFilter.mode(context.spColors.body, BlendMode.srcIn),
            ),
            onPressed: () => api.goBack(),
          ),
        ),
      ),
      body: SafeArea(
        child: StoreConnector<AppState, VisualisationType>(
          converter: (store) => store.state.visualisationType,
          builder: (context, visualisationType) {
            switch (visualisationType) {
              case VisualisationType.table:
                return const TableView();
              case VisualisationType.chart:
                return const ChartView();
            }
          },
        ),
      ),
    );
  }
}
