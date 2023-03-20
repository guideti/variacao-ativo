import 'dart:async';

import 'package:get/get.dart';

import '../../../ui.dart';

class BottomSheetWidget extends StatelessWidget {
  final HomePresenter presenter;
  final StreamController<IntervalEnum> intervalController;
  final StreamController<RangeDateEnum> rangeDateController;
  final StreamController<TotalItemEnum> totalItemController;

  const BottomSheetWidget({
    Key? key,
    required this.presenter,
    required this.intervalController,
    required this.rangeDateController,
    required this.totalItemController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height / 1.2,
      child: Column(
        children: [
          SizedBox(
            height: 30,
            child: Center(
              child: Container(
                height: 10,
                width: 80,
                decoration: BoxDecoration(
                  color: Theme.of(context).bottomNavigationBarTheme.unselectedItemColor,
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  const ListTile(
                    title: Text('Intervalo de data'),
                  ),
                  Obx(() {
                    var range = presenter.rangeDateRx.value;

                    return StreamBuilder(
                      stream: rangeDateController.stream,
                      initialData: range,
                      builder: ((context, snapshot) {
                        var groupValue = snapshot.data ?? range;

                        return GridView.count(
                          crossAxisCount: 2,
                          childAspectRatio: (1 / .3),
                          shrinkWrap: true,
                          children: RangeDateEnum.values
                              .map(
                                (e) => RadioListTile<RangeDateEnum>(
                                  title: Text(e.toDescription()),
                                  value: e,
                                  groupValue: groupValue,
                                  onChanged: (value) {
                                    if (value != null) {
                                      rangeDateController.sink.add(value);
                                    }
                                  },
                                ),
                              )
                              .toList(),
                        );
                      }),
                    );
                  }),
                  const ListTile(
                    title: Text('Intervalo de ativos'),
                  ),
                  Obx(() {
                    var interval = presenter.intervalRx.value;

                    return StreamBuilder(
                      stream: intervalController.stream,
                      initialData: interval,
                      builder: ((context, snapshot) {
                        var groupValue = snapshot.data ?? interval;

                        return GridView.count(
                          crossAxisCount: 2,
                          childAspectRatio: (1 / .3),
                          shrinkWrap: true,
                          children: IntervalEnum.values
                              .map(
                                (e) => RadioListTile<IntervalEnum>(
                                  title: Text(e.toDescription()),
                                  value: e,
                                  groupValue: groupValue,
                                  onChanged: (value) {
                                    if (value != null) {
                                      intervalController.sink.add(value);
                                    }
                                  },
                                ),
                              )
                              .toList(),
                        );
                      }),
                    );
                  }),
                  const ListTile(
                    title: Text('Mostrar total de items'),
                  ),
                  Obx(() {
                    var total = presenter.totalItemRx.value;

                    return StreamBuilder(
                      stream: totalItemController.stream,
                      initialData: total,
                      builder: ((context, snapshot) {
                        var groupValue = snapshot.data ?? total;

                        return GridView.count(
                          crossAxisCount: 2,
                          childAspectRatio: (1 / .3),
                          shrinkWrap: true,
                          children: TotalItemEnum.values
                              .map(
                                (e) => RadioListTile<TotalItemEnum>(
                                  title: Text(e.toDescription()),
                                  value: e,
                                  groupValue: groupValue,
                                  onChanged: (value) {
                                    if (value != null) {
                                      totalItemController.sink.add(value);
                                    }
                                  },
                                ),
                              )
                              .toList(),
                        );
                      }),
                    );
                  }),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
                presenter.fetch();
              },
              child: const Text(
                'APLICAR',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
