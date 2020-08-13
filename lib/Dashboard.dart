import 'package:ReadyToKnow/Detail.dart';
import 'package:ReadyToKnow/Login.dart';
import 'package:flutter/material.dart';

import 'Models/CategoryDummy.dart';
import 'RestAPI.dart';

class Dashboard extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/detail': (context) => Detail(),
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


  static Widget buildAppBar(BuildContext context, bool isSearchAppBar){
    return AppBar(
          elevation: 150.0,
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios, color: Colors.black),
            onPressed: () => Navigator.pushNamed(context, '/dashboard'),
          ),
          backgroundColor: Color(0xFF73AEF5),
          title: Text("Search..."),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.search),
              color: Colors.blue,
              onPressed: () {
                setState(() {
                  isSearchAppBar = !isSearchAppBar;
                });
              },
            )]
            ..addAll(
              isSearchAppBar ? 
             [
               TextField(
                 style: new TextStyle(
                    color: Colors.white,

                  ),
                  decoration: new InputDecoration(
                      prefixIcon: new Icon(Icons.search, color: Colors.white),
                      hintText: "Search...",
                      hintStyle: new TextStyle(color: Colors.white)
                  ),
               )
             ]
              :
            [
            IconButton(
              icon: Icon(Icons.more_vert),
              // onPressed: () => Navigator.pushNamed(context, '/detail'),
            ),
            ]
            
            )


            // true
            //     ? IconButton(
            //         icon: Icon(Icons.cancel),
            //         onPressed: () {
            //           setState(() {
            //             // this.isSearching = false;
            //             // filteredCountries = countries;
            //           });
            //         },
            //       )
            //     : IconButton(
            //         icon: Icon(Icons.search),
            //         onPressed: () {
            //           setState(() {
            //             // this.isSearching = true;
            //           });
            //         },
            //       )
        );
  }

  Widget buildSearchAppBar(BuildContext context){

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: buildAppBar(context, true),
        body: Container(
            child: FutureBuilder<List<Category>>(
          future: API.fetchCategories(),
          builder: (context, projectSnap) {
            return projectSnap.connectionState == ConnectionState.done
                ? ListView.builder(
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
        );
  }
}
