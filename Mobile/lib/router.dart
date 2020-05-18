import 'package:flutter/material.dart';
import 'package:ngtv_mobile/screens/index.dart';
import 'package:ngtv_mobile/screens/token.dart';

class Router {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/index':
        return MaterialPageRoute(builder: (_) => Index());
      case '/token':
        return MaterialPageRoute(builder: (_) => Token());
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(child: Text('No route defined for ${settings.name}')),
          ),
        );
    }
  }
}

// to navigate without data: Navigator.pushNamed(context, 'path');
// to navigate with data: Navigator.pushNamed(context, routeName, arguments: 'our data');
// and this router will look like this :
//
// case '/path':
//  return MaterialPageRoute(
//    builder: (_) => widgetName(dataName: settings.arguments),
//    settings: settings,
//  );
