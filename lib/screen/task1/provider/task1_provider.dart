import 'package:flutter/material.dart';

class Task1Provider extends ChangeNotifier
{
  double sliderValue = 1;
  String pattern = '1';

  void generatePattern(double value) {
    String patternt = '';
    for (int i = 1; i <= value; i++) {
      patternt += '${List.generate(i, (j) => j + 1).join()} \n';
    }
    pattern = patternt;
    notifyListeners();
  }
}