import 'package:flutter/material.dart';
import 'package:torch/torch.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '17it131_Practical6',
      home: Scaffold(
        appBar: AppBar(
          title: Text('17it131_Practical-6'),
          backgroundColor: Colors.lightBlue,
        ),
        body: Center(
          child: SingleChildScrollView(
            child: Container(
              child: Column(
                children: <Widget>[
                  RaisedButton(
                      child: Text(
                        'Flash On',
                        style: TextStyle(fontSize: 15.0),
                      ),
                      color: Colors.teal[300],
                      textColor: Colors.white,
                      onPressed: () {
                        Torch.turnOn();
                      }),
                  SizedBox(
                    height: 40.0,
                  ),
                  RaisedButton(
                      child: Text(
                        'Flash Off',
                        style: TextStyle(fontSize: 15.0),
                      ),
                      color: Colors.teal[300],
                      textColor: Colors.white,
                      onPressed: () {
                        Torch.turnOff();
                      }),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}