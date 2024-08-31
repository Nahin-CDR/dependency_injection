
import 'package:dependency_injection/providers/counterProvider.dart';
import 'package:flutter/material.dart';

class MultiplierProvider with ChangeNotifier{
  final CounterProvider counterProvider;
  int _factor = 2;

  MultiplierProvider({required this.counterProvider}){
   // listen to the changes in counter Provider
   counterProvider.addListener(() { });
  }

  int get multipliedValue => counterProvider.counter * _factor;

  void setFactor(int factor) {
    _factor = factor;
    notifyListeners();
  }

  void _onCounterChanged(){
    // notify listeners  when tje counter value changes
    notifyListeners();
  }


  @override
  void dispose(){
    counterProvider.removeListener(_onCounterChanged);
    super.dispose();
  }

}