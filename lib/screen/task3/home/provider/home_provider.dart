import 'package:exam_1/screen/task3/home/modal/home_modal.dart';
import 'package:exam_1/utils/api_helper.dart';
import 'package:flutter/material.dart';

class HomeProvider extends ChangeNotifier
{
  Future<Corona?> getCoronaData() async {
    Api apihelper = Api();
    Corona? corona = await apihelper.apicall();
    return corona;
  }
}