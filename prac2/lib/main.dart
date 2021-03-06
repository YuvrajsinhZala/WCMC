import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _SumState();
  }
}

class _SumState extends State<MyApp> {
  double firstnum, secondnum, sum;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "17it131_Practical-2",
      home: Scaffold(
      appBar: AppBar(
        title: Text("17it131_Practical-2"),
      ),
      body: Container(
        margin: EdgeInsets.all(20.0),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
          children: <Widget>[
            TextField(
            keyboardType: TextInputType.number,
            decoration:
              InputDecoration(labelText: "Enter num1 To Sum"),
            onChanged: (String value) {
              setState(() {
            firstnum = double.parse(value);
            });
          },
        ),
        SizedBox(
          height: 10.0,
        ),
        TextField(
          keyboardType: TextInputType.number,
          decoration:
            InputDecoration(labelText: "Enter num2 To Sum"),
        onChanged: (String value) {
          setState(() {
            secondnum = double.parse(value);
            });
          },
        ),
        SizedBox(
          height: 12.0,
        ),
        RaisedButton(
          child: Text("+ Summation +"),
          color: Colors.cyan,
          textColor: Colors.white,
          onPressed: () {
            sum = firstnum + secondnum;
            Fluttertoast.showToast(
              msg: " num1 + num2 = $sum",
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.BOTTOM,
              timeInSecForIos: 10,
              backgroundColor: Colors.cyan[900],
              textColor: Colors.white,
              fontSize: 16.0);
              },
            )
          ],
        )),
      )),
    ),
  );
  }
}