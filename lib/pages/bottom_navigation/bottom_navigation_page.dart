import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:maxiee_flutter_beamer_demo/pages/bottom_navigation/locations/articles_location.dart';
import 'package:maxiee_flutter_beamer_demo/pages/bottom_navigation/locations/books_location.dart';
import 'package:maxiee_flutter_beamer_demo/pages/bottom_navigation/widgets/bottom_navigation_bar.dart';

class BottomNavigationPage extends StatelessWidget {
  BottomNavigationPage({super.key});

  final _beamerKey = GlobalKey<BeamerState>();
  final _routerDelegate = BeamerDelegate(
    locationBuilder: BeamerLocationBuilder(
      beamLocations: [
        BooksLocation(),
        ArticlesLocation(),
      ],
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bottom Navigation'),
      ),
      body: Beamer(
        key: _beamerKey,
        routerDelegate: _routerDelegate,
      ),
      bottomNavigationBar: BottomNavigationBarWidget(
        beamerKey: _beamerKey,
      ),
    );
  }
}
