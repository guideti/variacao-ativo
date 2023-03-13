import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:variacao_ativa_flutter/core/dependency_injection/dependency_injection.dart';
import 'package:variacao_ativa_flutter/features/variacao-ativa/presentation/cubit/variacao_ativo_cubit.dart';
import 'package:variacao_ativa_flutter/features/variacao-ativa/presentation/pages/variacao_ativa_screen.dart';

import 'core/dependency_injection/dependency_injection.dart' as injector;

void main() {
  injector.setup();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Variacao Ativo Opah It',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BlocProvider(
        create: (context) => getIt<VariacaoAtivoCubit>(),
        child: const VariacaoAtivaScreen(),
      ),
    );
  }
}
