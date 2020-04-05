import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '17it131_Practical-4',
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            '17it131_Practical-4',
            style: TextStyle(color: Colors.black),
          ),
          backgroundColor: Colors.lightBlue[800],
        ),
        body: TempConvert(),
      ),
    );
  }
}

class TempConvert extends StatefulWidget {
  @override
  _TempConvertState createState() => _TempConvertState();
}

class _TempConvertState extends State<TempConvert> {
  String dropValue = 'Celsius';
  double textValue, answer;
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.all(45.0),
        child: Center(
          child: SingleChildScrollView( 
            child: Column(
              children: <Widget>[
                DropdownButton<String>(
                  value: dropValue,
                  icon: Icon(Icons.arrow_downward),
                  iconSize: 20,
                  style: TextStyle(color: Colors.blueGrey[800], fontSize: 20.0),
                  onChanged: (String newValue) {
                    setState(() {
                      dropValue = newValue;
                    });
                  },
                  items: <String>['Celsius', 'Fahrenheit']
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
                SizedBox(
                  height: 20.0,
                ),
                TextField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(labelText: 'Enter Value to Convert'),
                  onChanged: (String val) {
                    textValue = double.parse(val);
                  },
                ),
                SizedBox(
                  height: 30.0,
                ),
                RaisedButton(
                  child: Text(
                    'Convert',
                    style: TextStyle(fontSize: 22.0),
                  ),
                  color: Colors.lightBlue[200],
                  onPressed: () {
                    if (dropValue == 'Celsius') {
                      setState(() {
                        answer = ((textValue * 1.8) + 32);
                      });
                    } else {
                      setState(() {
                        answer = ((textValue - 32) / 1.8);
                      });
                    }
                  },
                ),
                SizedBox(
                  height: 30.0,
                ),
                Text(
                  '$answer °',
                  style: TextStyle(fontSize: 20.0),
                ),
              ],
            ),
          ),
        ));
  }
}