import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(title: Text('Rows & Columns')),
        body: RowsAndColumns(),
      ),
    );
  }
}

class RowsAndColumns extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 100.0),
      child: IntrinsicHeight(
        child: Row(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
          Expanded(
            child: Column(children: [
              Container(height: 120.0, color: Colors.yellow),
              Container(height: 100.0, color: Colors.cyan),
            ]),
          ),
          Expanded(child: Container(color: Colors.amber)),
        ]),
      ),
    );
  }}