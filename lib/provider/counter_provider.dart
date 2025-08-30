import 'package:flutter/material.dart';

class CounterProvider extends ChangeNotifier {
  int _counter = 0;

  int get counter => _counter;

  increament() {
    _counter++;
    notifyListeners();
  }

  updateCounterValue(String newCounterValueAsString) {
    int? newCounterValueAsInt = int.tryParse(newCounterValueAsString);
    if (newCounterValueAsInt != null) {
      _counter = newCounterValueAsInt;
      notifyListeners();
    } else {}
  }
}

// class Things {
//   List<String> name = [];
// }
