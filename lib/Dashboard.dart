import 'package:ReadyToKnow/Detail.dart';
import 'package:flutter/material.dart';

import 'Models/CategoryDummy.dart';
import 'RestAPI.dart';

class Dashboard extends StatelessWidget {
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

  // List<Category> futureCategories;

  // @override
  // void initState() {
  //   super.initState();
  //   getCategories();
  // }

  // @override
  // dispose() {
  //   super.dispose();
  // }

  // getCategories() async {
  //   API.fetchCategories().then((value) {
  //     setState(() {
  //       futureCategories = value;
  //     });
  //   });
  // }

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
            child: FutureBuilder<List<Category>>(
          future: API.fetchCategories(),
          builder: (context, projectSnap) {
            return 
             projectSnap.connectionState == ConnectionState.done                ?
             ListView.builder(
                    itemCount: projectSnap.data.length,
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
                              projectSnap.data[index].name,
                              style: TextStyle(fontSize: 18),
                            ),
                          ),
                        ),
                      );
                    })
                : Center(
                    child: CircularProgressIndicator(),
                  );
          },
        ))
        // Container(
        //   padding: EdgeInsets.all(10),
        //   child:
        //   futureCategories != null && futureCategories.length > 0
        //       ? ListView.builder(
        //           itemCount: futureCategories.length,
        //           itemBuilder: (BuildContext context, int index) {
        //             return GestureDetector(
        //               onTap: () {
        //                 // Navigator.of(context).pushNamed(Country.routeName,
        //                 //     arguments: countries[index]);
        //                 Navigator.pushNamed(context, '/detail');
        //               },
        //               child: Card(
        //                 elevation: 10,
        //                 child: Padding(
        //                   padding: const EdgeInsets.symmetric(
        //                       vertical: 10, horizontal: 8),
        //                   child: Text(
        //                     futureCategories[index].name,
        //                     style: TextStyle(fontSize: 18),
        //                   ),
        //                 ),
        //               ),
        //             );
        //           })
        //       : Center(
        //           child: CircularProgressIndicator(),
        //         ),
        // ),
        );
  }
}
