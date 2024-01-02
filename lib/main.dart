import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:maxiee_flutter_beamer_demo/pages/bottom_navigation/bottom_navigation_page.dart';
import 'package:maxiee_flutter_beamer_demo/pages/home/home_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final _routerDelegate = BeamerDelegate(
      routeListener: (infomation, delegate) {
        print('BeamerDelegate.routeListener: ${infomation.uri.toString()}');
      },
      locationBuilder: RoutesLocationBuilder(routes: {
        '/': (context, state, data) => const HomePage(),
        '/bottom_navigation': (context, state, data) => BottomNavigationPage(),
      }));

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routeInformationParser: BeamerParser(),
      routerDelegate: _routerDelegate,
      backButtonDispatcher: BeamerBackButtonDispatcher(
        delegate: _routerDelegate,
      ),
    );
  }
}
