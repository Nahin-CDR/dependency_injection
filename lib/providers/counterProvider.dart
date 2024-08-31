
import 'dart:async';
import 'package:flutter/material.dart';

class CounterProvider with ChangeNotifier{
  int _counter = 0;
  Timer? _timer;

  int get counter => _counter;

  // constructor of CounterProvider
  CounterProvider(){
    //_startCounter();
  }


  void startCounter(){
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      _counter++;
      notifyListeners();
    });
  }



  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

}