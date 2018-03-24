import 'package:flutter/material.dart';
import 'package:json_test/PersonList.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget{

  @override
  Widget build(BuildContext context){

    return new MaterialApp(
      title: 'Json Test',
      home: new PersonList(),
    );

  }
}