import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:variacao_ativa_flutter/core/common/native_helper.dart';
import 'package:variacao_ativa_flutter/features/variacao-ativa/presentation/cubit/variacao_ativo_cubit.dart';

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
      } on PlatformException catch (e) {
        cubit.setError(errorMessage: e.message.toString());
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue.shade800,
        leading: IconButton(
          onPressed: () => platform.invokeMethod('exitFlutter'),
          icon: const Icon(Icons.arrow_back_ios),
        ),
      ),
      body: BlocBuilder<VariacaoAtivoCubit, VariacaoAtivoState>(
        builder: (context, state) {
          if (state is VariacaoAtivoError) {
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  state.errorMessage,
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
                const SizedBox(
                  height: 24,
                ),
                ElevatedButton(
                  onPressed: () =>
                      cubit.getActiveVariation(activeName: activeName),
                  child: const Text('Tentar novamente'),
                ),
              ],
            );
          }

          if (state is VariacaoAtivoSuccess) {
            Center(
              child: Text(
                state.chart.indicators.first.quote.first.open.first.toString(),
                style: Theme.of(context).textTheme.headlineMedium,
              ),
            );
          }

          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
