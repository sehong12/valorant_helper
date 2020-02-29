import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppHome extends StatelessWidget {
  static const String routeName = '/';
  final String title;
  AppHome({Key key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(),
      body: Text('Sample')
    );
  }

}