import 'package:exam_1/screen/task1/view/task1_screen.dart';
import 'package:exam_1/screen/task2/login/view/login_screen.dart';
import 'package:exam_1/screen/task2/view/task2_screen.dart';
import 'package:exam_1/screen/task3/home/view/home_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreenM extends StatefulWidget {
  const HomeScreenM({Key? key}) : super(key: key);

  @override
  State<HomeScreenM> createState() => _HomeScreenMState();
}

class _HomeScreenMState extends State<HomeScreenM> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: DefaultTabController(
        length: 3,
        child: Scaffold(
          backgroundColor: Colors.teal.shade100,
          appBar: AppBar(
            backgroundColor: Colors.teal.shade900,
            title: Text("Exam"),
            bottom: TabBar(indicatorColor: Colors.teal.shade100,tabs: [
              Text("Task1",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w600)),
              Text("Task2",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w600)),
              Text("Task3",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w600)),
            ]),
          ),
          body: TabBarView(children: [Task1Screen(),LoginScreen(),HomeScreen()]),
        ),
      ),
    );
  }
}
