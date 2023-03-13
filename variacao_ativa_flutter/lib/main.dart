import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    super.key,
  });

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final platform = const MethodChannel('com.raul.variacaoativa');
  late String activeName = '';

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      late String result;
      try {
        result = activeName = await platform.invokeMethod('getActiveName');
      } on PlatformException catch (e) {
        result = e.message.toString();
      }

      setState(() {
        activeName = result;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Variação de Ativo'),
        leading: IconButton(
          onPressed: () => platform.invokeMethod('exitFlutter'),
          icon: const Icon(Icons.arrow_back_ios),
        ),
      ),
      body: Center(
        child: Text(
          activeName,
          style: Theme.of(context).textTheme.headlineMedium,
        ),
      ),
    );
  }
}
