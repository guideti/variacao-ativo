import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:variacao_ativa_flutter/core/common/native_helper.dart';
import 'package:variacao_ativa_flutter/features/variacao-ativa/presentation/cubit/variacao_ativo_cubit.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class VariacaoAtivaScreen extends StatefulWidget {
  const VariacaoAtivaScreen({Key? key}) : super(key: key);

  @override
  State<VariacaoAtivaScreen> createState() => _VariacaoAtivaScreenState();
}

class _VariacaoAtivaScreenState extends State<VariacaoAtivaScreen> {
  late String activeName;
  late VariacaoAtivoCubit cubit;
  @override
  void initState() {
    cubit = context.read<VariacaoAtivoCubit>();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      try {
        activeName = await platform.invokeMethod('getActiveName');
        cubit.getActiveVariation(activeName: activeName);
      } on PlatformException catch (_) {
        cubit.setGetActiveError();
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Variação Ativo'),
        backgroundColor: Colors.blue.shade800,
        leading: IconButton(
          onPressed: () => platform.invokeMethod('exitFlutter'),
          icon: const Icon(Icons.arrow_back_ios),
        ),
      ),
      body: Center(
        child: BlocBuilder<VariacaoAtivoCubit, VariacaoAtivoState>(
          builder: (context, state) {
            if (state is VariacaoAtivoError ||
                state is VariacaoAtivoGetActiveError) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    _errorMessage(state),
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  ElevatedButton(
                    onPressed: () => _onPressedButton(state: state),
                    child: const Text('Tentar novamente'),
                  ),
                ],
              );
            }

            if (state is VariacaoAtivoSuccess) {
              return SfCartesianChart(
                title: ChartTitle(text: 'Variação de ativos ($activeName)'),
                series: getData(actives: state.chart.actives.first.quote),
              );
            }

            return const Center(
              child: CircularProgressIndicator(),
            );
          },
        ),
      ),
    );
  }

  String _errorMessage(VariacaoAtivoState state) => state is VariacaoAtivoError
      ? state.errorMessage
      : 'Erro ao comunicar com nativo';

  Future<void> _onPressedButton({required VariacaoAtivoState state}) async {
    if (state is VariacaoAtivoGetActiveError) {
      try {
        activeName = await platform.invokeMethod('getActiveName');
        await cubit.getActiveVariation(activeName: activeName);
      } on PlatformException catch (_) {
        cubit.setGetActiveError();
      }
    } else {
      cubit.getActiveVariation(activeName: activeName);
    }
  }

  static List<LineSeries<double, int>> getData(
      {required List<double?> actives}) {
    actives.removeWhere((element) => element == null);
    final newActives = actives.map((e) => e ?? 0.0).toList().take(30).toList();
    return <LineSeries<double, int>>[
      LineSeries(
        dataSource: newActives,
        xValueMapper: (_, value) => value,
        yValueMapper: (value, _) => value,
      ),
    ];
  }
}
