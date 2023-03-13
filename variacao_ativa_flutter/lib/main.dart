import 'package:flutter/material.dart';
import 'package:variacao_ativa_flutter/features/variacao-ativa/presentation/pages/variacao_ativa_screen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Variacao Ativo Opah It',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const VariacaoAtivaScreen(),
    );
  }
}
