import 'package:calculadora_con_provider/providers/providers.dart';
import 'package:calculadora_con_provider/screens/screens.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(
  MultiProvider(
    providers: [
      ChangeNotifierProvider(
        create: ( _ ) => OperacionesProvider()
      ),
    ],
    child: const MyApp(),
  )
);

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      initialRoute: 'calculadora',
      routes: {
        'calculadora' : ( _ ) => const CalculadoraScreen()
      }
    );
  }
}