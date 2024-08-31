
import 'package:dependency_injection/home.dart';
import 'package:dependency_injection/providers/counterProvider.dart';
import 'package:dependency_injection/providers/multiplierProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
      MultiProvider(
          providers:[
            ChangeNotifierProvider(create: (_) => CounterProvider()),
            ChangeNotifierProxyProvider<CounterProvider, MultiplierProvider>(
              create:  (context) => MultiplierProvider(
                  counterProvider: Provider.of<CounterProvider>(context,listen: false)
              ),
              update: (context, counterProvider, multiplierProvider) {
                  return MultiplierProvider(counterProvider: counterProvider);
              },
            ),
          ],
          child: const DependencyInjectionApp()
      )
  );
}

class DependencyInjectionApp extends StatefulWidget {
  const DependencyInjectionApp({super.key});

  @override
  State<DependencyInjectionApp> createState() => _DependencyInjectionAppState();
}

class _DependencyInjectionAppState extends State<DependencyInjectionApp> {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Dependency Injection Demo',
      home: Home(),
    );
  }
}
