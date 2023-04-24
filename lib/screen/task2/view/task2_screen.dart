import 'package:exam_1/screen/task2/provider/task2_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Task2Screen extends StatefulWidget {
  const Task2Screen({Key? key}) : super(key: key);

  @override
  State<Task2Screen> createState() => _Task2ScreenState();
}

class _Task2ScreenState extends State<Task2Screen> {
  Task2Provider? task2providerf;
  Task2Provider? task2providert;

  @override
  Widget build(BuildContext context) {
    task2providerf = Provider.of<Task2Provider>(context, listen: false);
    task2providert = Provider.of<Task2Provider>(context, listen: true);
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.teal,
          title: Text(
            "Todo",
          ),
          actions: [
            IconButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      content: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          TextField(
                            decoration: InputDecoration(
                                focusedBorder: OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.black)),
                                enabledBorder: OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.black)),
                                label: Text(
                                  "Todo",
                                  style: TextStyle(color: Colors.black54),
                                )),
                            controller: task2providerf!.txttodo,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              TextButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  child: Text("Back")),
                              TextButton(
                                  onPressed: () {
                                    task2providerf!
                                        .todoadd(task2providerf!.txttodo.text);
                                    task2providerf!.txttodo.clear();
                                    Navigator.pop(context);
                                  },
                                  child: Text("Save")),
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                },
                icon: Icon(Icons.add)),
          ],
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 10,
            ),
            Text("   Todo(${task2providerf!.todo.length})",
                style: TextStyle(fontSize: 23, fontWeight: FontWeight.w600)),
            SizedBox(
              width: 350,
              height: 300,
              child: ListView.builder(
                itemBuilder: (context, index) => Container(
                  decoration: BoxDecoration(
                      border: Border(
                          bottom: BorderSide(color: Colors.black26))),
                  child: Row(
                    children: [
                      Container(
                        width: 10,
                        height: 50,
                        color: Colors.teal,
                      ),
                      Text("  ${task2providert!.todo[index]}",style: TextStyle(fontSize: 20)),
                      Expanded(child: SizedBox()),
                      InkWell(
                        onTap: () {
                          task2providerf!
                              .ctodoadd(task2providert!.todo[index], index);
                        },
                        child: Container(
                          height: 35,
                          width: 35,
                          color: Colors.green,
                          child: Icon(Icons.done, color: Colors.white),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          task2providerf!.txttodo = TextEditingController(
                              text: task2providerf!.todo[index]);
                          showDialog(
                            context: context,
                            builder: (context) => AlertDialog(
                              content: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  TextField(
                                    decoration: InputDecoration(
                                        focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                                color: Colors.black)),
                                        enabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                                color: Colors.black)),
                                        label: Text(
                                          "Todo",
                                          style: TextStyle(
                                              color: Colors.black54),
                                        )),
                                    controller: task2providerf!.txttodo,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      TextButton(
                                          onPressed: () {
                                            Navigator.pop(context);
                                          },
                                          child: Text("Back")),
                                      TextButton(
                                          onPressed: () {
                                            task2providerf!.todoedit(
                                                task2providerf!
                                                    .txttodo.text,
                                                index);
                                            task2providerf!.txttodo.clear();
                                            Navigator.pop(context);
                                          },
                                          child: Text("Save")),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                        child: Container(
                          height: 35,
                          width: 35,
                          color: Colors.amber,
                          child: Icon(Icons.edit, color: Colors.white),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          task2providerf!.delettodo(index);
                        },
                        child: Container(
                          height: 35,
                          width: 35,
                          color: Colors.red,
                          child: Icon(Icons.delete, color: Colors.white),
                        ),
                      )
                    ],
                  ),
                ),
                itemCount: task2providert!.todo.length,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text("   Done(${task2providerf!.ctodo.length})",
                style: TextStyle(fontSize: 23, fontWeight: FontWeight.w600)),
            Expanded(
              child: ListView.builder(
                itemBuilder: (context, index) => Container(
                  child: Row(
                    children: [
                      Container(
                        width: 10,
                        height: 50,
                        color: Colors.green,
                      ),
                      Container(
                        height: 30,
                          width: 350,
                          decoration: BoxDecoration(
                              border: Border(
                                  bottom: BorderSide(color: Colors.black26))),
                          child: Text(
                            "  ${task2providert!.ctodo[index]}",
                            style: TextStyle(fontSize: 20),
                          )),
                    ],
                  ),
                ),
                itemCount: task2providert!.ctodo.length,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
