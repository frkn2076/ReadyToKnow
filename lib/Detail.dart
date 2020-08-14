import 'package:ReadyToKnow/Dashboard.dart';
import 'package:flutter/material.dart';

class Detail extends StatelessWidget {
  final int id;
  const Detail(this.id);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: 'Welcome to Flutter',
    routes: {
        '/dashboard': (context) => Dashboard()
      },
     home: DetailHome(id: id));
  }
}

class DetailHome extends StatefulWidget {
  final int id;
  DetailHome({Key key, this.id}) : super(key: key);

  @override
  _DetailHomeState createState() => _DetailHomeState();
}

class _DetailHomeState extends State<DetailHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          elevation: 150.0,
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios, color: Colors.black),
            onPressed: () =>
                Navigator.pushNamed(context, '/dashboard'),
          ),
          backgroundColor: Color(0xFF73AEF5),
          // title: Text("Search..."),
          actions: [
            IconButton(
              icon: Icon(Icons.more_vert),
              color: Colors.white,
              onPressed: () {
                setState() {}
              },
            ),
          ]),
      body: Center(
        child: Text("Detail Page ${widget.id}"),
      ),
    );
  }
}
