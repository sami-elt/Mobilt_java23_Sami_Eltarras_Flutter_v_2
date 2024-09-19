import 'package:flutter/material.dart';


class SecondRoute extends StatelessWidget {
  const SecondRoute({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Second Page'),
        backgroundColor: Colors.lightBlueAccent,
        centerTitle: true,
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.pop(context);  // Pop to go back to the FirstPage
          },
          child: Image.network(
              'https://docs.flutter.dev/assets/images/dash/dash-fainting.gif'),
        ),
      ),
    );
  }
}


