import 'package:ReadyToKnow/Detail.dart';
import 'package:ReadyToKnow/Login.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_html/flutter_html.dart';
import 'package:loader_search_bar/loader_search_bar.dart';

import 'Models/CategoryDummy.dart';
import 'RestAPI.dart';

class Dashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/detail': (context) => Detail(ModalRoute.of(context).settings.arguments),
        '/login': (context) => Login()
      },
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: DashboardHomePage(),
    );
  }
}

class DashboardHomePage extends StatefulWidget {
  DashboardHomePage() : super();

  @override
  _DashboardHomePageState createState() => _DashboardHomePageState();
}

class _DashboardHomePageState extends State<DashboardHomePage> {
  bool isSearchAppBar = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: SearchBar(
            searchHint: "Search...",
            defaultBar: AppBar(
                elevation: 150.0,
                leading: IconButton(
                  icon: Icon(Icons.arrow_back_ios, color: Colors.black),
                  onPressed: () => Navigator.pushNamed(context, '/login', arguments: 3),
                ),
                backgroundColor: Color(0xFF73AEF5),
                // title: Text("Search..."),
                actions: [
                  IconButton(
                    icon: Icon(Icons.more_vert),
                    color: Colors.white,
                    onPressed: () {
                      setState() {

                      }
                    },
                  ),
                ])),
        body: Container(
            child: FutureBuilder<List<MyCategory>>(
          future: API.fetchCategories(),
          builder: (context, projectSnap) {
            return projectSnap.connectionState == ConnectionState.done
                ? ListView.builder(
                    itemCount: projectSnap.data.length,
                    itemBuilder: (BuildContext context, int index) {
                      return GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, '/detail', arguments: 3);
                        },
                        child: Card(
                          elevation: 10,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 10, horizontal: 8),
                            child: Text(
                              projectSnap.data[index].name,
                              style: TextStyle(fontSize: 18),
                            ),
                            // Html(data:"<p>Hello <b>Flutter</b><p>"),
                          ),
                        ),
                      );
                    })
                : Center(
                    child: CircularProgressIndicator(),
                  );
          },
        )));
  }
}
