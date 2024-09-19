import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_il/main2.dart';
import 'package:fluttertoast/fluttertoast.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => const FirstPage(),
        '/secondPage': (context) => const SecondRoute()
      },
    );
  }
}

class FirstPage extends StatefulWidget {
  const FirstPage({super.key});

  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  final controller = TextEditingController();
  List<String> task = [];

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  //only adding a task if input is not empty and after adding clearing inputfield
  void addTask() {
    setState(() {
      if (controller.text.isNotEmpty) {
        task.add(controller.text);
        controller.clear();
      }else {
        Fluttertoast.showToast(
            msg: "please enter task",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16.0);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        title: const Text('Welcome'),
        centerTitle: true,
      ),
      body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      controller: controller,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Add task',
                      ),
                    ),
                  ),
                  FloatingActionButton(
                    onPressed: addTask,
                    child: const Icon(CupertinoIcons.pen),
                  ),
                ],
              ),
              Expanded(
                child: ListWheelScrollView(

                  itemExtent: 60,
                  children: <Widget>[
                    ListView.builder(
                      itemCount: task.length,
                      itemBuilder: (context, index) {
                        return Dismissible(
                          background: Container(
                            color: Colors.amber,
                          ),
                          key: ValueKey<String>(task[index]),
                          onDismissed: (DismissDirection direction) {
                            setState(() {
                              task.removeAt(index);
                            });
                          },
                          child: ListTile(
                            title: Text(task[index]),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/secondPage');
                },
                child: const Text('Click here!'),
              ),
            ],
          ),
        ),
    );
  }
}
