import 'package:flutter/material.dart';

class Task2Provider extends ChangeNotifier
{
  TextEditingController txttodo = TextEditingController();
  List todo = [];
  List ctodo = [];
  void todoadd(String todotxt)
  {
    todo.add(todotxt);
    notifyListeners();
  }

  void todoedit(String todotxt,int index)
  {
    todo[index]=todotxt;
    notifyListeners();
  }

  void ctodoadd(String todotxt,int index)
  {
    ctodo.add(todotxt);
    todo.removeAt(index);
    notifyListeners();
  }

  void delettodo(int index)
  {
    todo.removeAt(index);
    notifyListeners();
  }
}