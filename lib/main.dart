import 'package:exam_1/screen/home/view/main_home_screen.dart';
import 'package:exam_1/screen/task1/provider/task1_provider.dart';
import 'package:exam_1/screen/task2/login/provider/login_proivder.dart';
import 'package:exam_1/screen/task2/provider/task2_provider.dart';
import 'package:exam_1/screen/task3/home/provider/home_provider.dart';
import 'package:exam_1/screen/task3/home/view/home_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main()
{
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => Task1Provider(),),
        ChangeNotifierProvider(create: (context) => Task2Provider(),),
        ChangeNotifierProvider(create: (context) => LoginProvider(),),
        ChangeNotifierProvider(create: (context) => HomeProvider(),),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          '/':(context) => HomeScreenM(),
          'home':(context) => HomeScreen(),
        },
      ),
    ),
  );
}