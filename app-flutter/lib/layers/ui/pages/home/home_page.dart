import 'dart:async';

import 'package:get/get.dart';

import '../../ui.dart';
import 'widgets/widgets.dart';

class HomePage extends StatefulWidget {
  final HomePresenter presenter;

  const HomePage(this.presenter, {Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin, NavigationManager, UISnackbarMessageManager {
  final StreamController<TotalItemEnum> _totalItemController = StreamController<TotalItemEnum>.broadcast();
  final StreamController<RangeDateEnum> _rangeDateController = StreamController<RangeDateEnum>.broadcast();
  final StreamController<IntervalEnum> _intervalController = StreamController<IntervalEnum>.broadcast();
  final StreamController<int> _indexPageController = StreamController<int>.broadcast();

  PageController pageController = PageController(
    initialPage: 0,
    keepPage: true,
  );

  void pageChanged(int index) => _indexPageController.sink.add(index);

  void bottomTapped(int index) {
    _indexPageController.sink.add(index);
    pageController.animateToPage(
      index,
      duration: const Duration(milliseconds: 500),
      curve: Curves.ease,
    );
  }

  @override
  void initState() {
    handleSnackbarMessage(widget.presenter.mainSnackbarMessageStream, context);

    _totalItemController.stream.listen((event) {
      widget.presenter.changeTotalItem(event);
    });

    _rangeDateController.stream.listen((event) {
      widget.presenter.changeRangeDate(event);
    });

    _intervalController.stream.listen((event) {
      widget.presenter.changeInterval(event);
    });

    super.initState();
  }

  @override
  void dispose() {
    _indexPageController.close();
    _intervalController.close();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultContainer(
      style: SystemUiOverlayStyle.dark.copyWith(
        systemNavigationBarColor: Theme.of(context).scaffoldBackgroundColor,
        statusBarColor: Theme.of(context).scaffoldBackgroundColor,
      ),
      child: Obx(() {
        var receiver = widget.presenter.isReceiverRx.value;
        return Scaffold(
          appBar: receiver
              ? AppBar()
              : AppBar(
                  title: const Text(
                    "Petrobras (PETR4.SA)",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  actions: [
                    IconButton(
                      onPressed: widget.presenter.fetch,
                      icon: const Icon(
                        Icons.refresh_rounded,
                      ),
                    ),
                  ],
                ),
          floatingActionButton: FloatingActionButton(
            onPressed: () => showModalBottomSheet(
              isScrollControlled: true,
              context: context,
              backgroundColor: Theme.of(context).scaffoldBackgroundColor,
              builder: (context) {
                return BottomSheetWidget(
                  presenter: widget.presenter,
                  intervalController: _intervalController,
                  rangeDateController: _rangeDateController,
                  totalItemController: _totalItemController,
                );
              },
            ),
            child: const Icon(
              Icons.tune_rounded,
            ),
          ),
          body: PageView(
            physics: const ClampingScrollPhysics(),
            controller: pageController,
            onPageChanged: pageChanged,
            children: [
              TableWidget(presenter: widget.presenter),
              ChartWidget(presenter: widget.presenter),
            ],
          ),
          bottomNavigationBar: StreamBuilder<int>(
              stream: _indexPageController.stream,
              initialData: 0,
              builder: (context, snapshot) {
                int indexPage = snapshot.data ?? 0;
                return BottomNavigationBar(
                  onTap: bottomTapped,
                  currentIndex: indexPage,
                  items: const [
                    BottomNavigationBarItem(
                      icon: Icon(Icons.dashboard_rounded),
                      label: "Tabela",
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(Icons.query_stats_rounded),
                      label: "Gráfico",
                    ),
                  ],
                );
              }),
        );
      }),
    );
  }
}
