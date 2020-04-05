import 'package:flutter/material.dart';
import 'package:carousel_widget/carousel_widget.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Carousel',
      home: MyCarousel(),
    );
  }
}

class MyCarousel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('17it131_Practical-8'),
        backgroundColor: Colors.lightBlue,
      ),
      body: Column(
        children: <Widget>[
          Container(
            height: 250.0,
            child: Carousel(
              listViews: [
                Fragment(
                  child: ListView(
                    children: <Widget>[
                      Image.asset('images/4.png'),
                    ],
                  ),
                ),
                Fragment(
                  child: ListView(
                    children: <Widget>[
                      Image.asset('images/2.png'),
                    ],
                  ),
                ),
                Fragment(
                  child: ListView(
                    children: <Widget>[
                      Image.asset('images/3.png'),
                    ],
                  ),
                ),
                Fragment(
                  child: ListView(
                    children: <Widget>[
                      Image.asset('images/1.png'),
                    ],
                  ),
                )
              ],
            ),
          ),
          Container(
              height: 300.0,
              child: Fragment(
                child: ListView.builder(
                    itemCount: 6,
                    itemBuilder: ((context, index) => ListTile(
                          title: Text('index $index'),
                        ))),
              ))
        ],
      ),
    );
  }
}
