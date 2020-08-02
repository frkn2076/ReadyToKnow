import 'package:ReadyToKnow/Detail.dart';
import 'package:flutter/material.dart';

import 'RestAPI.dart';


class MyApp2 extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Deneme',
      routes: {
      // When navigating to the "/" route, build the FirstScreen widget.
      '/detail': (context) => Detail(),
      // // When navigating to the "/second" route, build the SecondScreen widget.
      // '/second': (context) => SecondScreen(),
    },
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Dashboard(),
    );
  }
}


class Dashboard extends StatefulWidget {

  Dashboard() : super();

  @override
  _DashboardState createState() => _DashboardState();

  
}


class _DashboardState extends State<Dashboard> {

  final List<String> countries = ["Furkan", "Batuhan", "Rıdvan"];

  Future<List<Category>> futureCategories;

  @override
  void initState() {
    super.initState();
    futureCategories = fetchCategories();

  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pink,
        title: Text("HEREE"),
        // actions: <Widget>[
        //   isSearching
        //       ? IconButton(
        //           icon: Icon(Icons.cancel),
        //           onPressed: () {
        //             setState(() {
        //               this.isSearching = false;
        //               filteredCountries = countries;
        //             });
        //           },
        //         )
        //       : IconButton(
        //           icon: Icon(Icons.search),
        //           onPressed: () {
        //             setState(() {
        //               this.isSearching = true;
        //             });
        //           },
        //         )
        // ],
      ),
      body: Container(
        padding: EdgeInsets.all(10),
        child: 
        countries.length > 0
            ? ListView.builder(
                itemCount: countries.length,
                itemBuilder: (BuildContext context, int index) {
                  return GestureDetector(
                    onTap: () {
                      // Navigator.of(context).pushNamed(Country.routeName,
                      //     arguments: countries[index]);
                      Navigator.pushNamed(context, '/detail');
                    },
                    child: Card(
                      elevation: 10,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 8),
                        child: Text(
                          countries[index],
                          style: TextStyle(fontSize: 18),
                        ),
                      ),
                    ),
                  );
                })
            : Center(
                child: CircularProgressIndicator(),
              ),
      ),
    );
  }
}
