import 'package:exam_1/screen/task1/provider/task1_provider.dart';
import 'package:exam_1/screen/task2/provider/task2_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Task1Screen extends StatefulWidget {
  const Task1Screen({Key? key}) : super(key: key);

  @override
  State<Task1Screen> createState() => _Task1ScreenState();
}

class _Task1ScreenState extends State<Task1Screen> {
  Task1Provider? task1providerf;
  Task1Provider? task1providert;
  @override
  Widget build(BuildContext context) {
    task1providerf = Provider.of<Task1Provider>(context,listen: false);
    task1providert = Provider.of<Task1Provider>(context,listen: true);
    return SafeArea(
        child: Scaffold(
          backgroundColor: Colors.teal.shade100,
          appBar: AppBar(
            title: const Text("Pattern"),
            centerTitle: true,
            backgroundColor: Colors.teal.shade900,
          ),
          body: Column(
            children: [
              Slider(
                inactiveColor: Colors.teal.shade300,
                activeColor: Colors.teal.shade900,
                value: task1providert!.sliderValue,
                min: 1,
                max: 25,
                divisions: 25,
                onChanged: (value) {
                    task1providert!.sliderValue = value;
                },
                onChangeEnd: task1providerf!.generatePattern,
              ),
              SizedBox(height: 20),
              Text("${task1providert!.pattern}",
                style: TextStyle(fontSize: 20,color: Colors.teal.shade900),
                textAlign: TextAlign.start,
              ),
            ],
          ),
        ));
  }
}