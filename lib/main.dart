import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import 'controller/produto_controller.dart';
import 'view/produto_view.dart';

final g = GetIt.instance;

void main() {
  g.registerSingleton<ProdutoController>(ProdutoController());
  runApp(
    DevicePreview(builder: (context) => const MainApp()),
  );
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Produtos',
      initialRoute: 'produtos',
      routes: {
        'produtos': (context) => ProdutoView(),
      },
    );
  }
}
