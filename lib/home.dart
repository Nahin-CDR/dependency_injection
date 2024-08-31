import 'package:dependency_injection/providers/counterProvider.dart';
import 'package:dependency_injection/providers/multiplierProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    final counterProvider = Provider.of<CounterProvider>(context);
    final multiplierProvider = Provider.of<MultiplierProvider>(context);

    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Counter: ${counterProvider.counter}', style: const TextStyle(fontSize: 24)),
          const SizedBox(height: 20),
          Text('Multiplied Value: ${multiplierProvider.multipliedValue}',
              style: const TextStyle(fontSize: 24)
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  multiplierProvider.setFactor(2);
                },
                child: const Text('x2'),
              ),
              const SizedBox(width: 10),
              ElevatedButton(
                onPressed: () {
                  multiplierProvider.setFactor(3);
                },
                child: const Text('x3'),
              ),
              const SizedBox(width: 10),
              ElevatedButton(
                onPressed: () {
                  counterProvider.startCounter();
                  //multiplierProvider.setFactor(5);
                },
                child: const Text('start counter'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}