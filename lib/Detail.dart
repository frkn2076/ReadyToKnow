import 'package:flutter/material.dart';

class Detail extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Welcome to Flutter',
      home: DetailHome()
    );
  }
}

class DetailHome extends StatefulWidget {

  DetailHome() : super();

  @override
  _DetailHomeState createState() => _DetailHomeState();

}

class _DetailHomeState extends State<DetailHome> {

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        appBar: AppBar(
          title: Text('Welcome to Detail Page'),
        ),
        body: Center(
          child: Text('Detail Page'),
        ),
      );
  }}