import 'package:flutter/material.dart';

import '../commons/commons.dart';
import 'layers/main/main.dart';

@pragma("vm:entry-point")
void nativeLoad() async {
  WidgetsFlutterBinding.ensureInitialized();

  instanceUrl();
  runApp(const App());
}

void main() {
  instanceUrl();
  runApp(const App());
}
