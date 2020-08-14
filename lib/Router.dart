import 'package:flutter/material.dart';

import 'Dashboard.dart';
import 'Detail.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    // Getting arguments passed in while calling Navigator.pushNamed
        switch (settings.name) {
          case '/dashboard':
            return MaterialPageRoute(builder: (_) => Dashboard());
            break;
          case '/detail':
            return MaterialPageRoute(builder: (_) => Detail(settings.arguments));
            break;
          default:
            return _errorRoute();
        }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: Text('Error'),
        ),
        body: Center(
          child: Text('ERROR'),
        ),
      );
    });
  }
}