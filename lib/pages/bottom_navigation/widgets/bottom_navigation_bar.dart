import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:maxiee_flutter_beamer_demo/pages/bottom_navigation/locations/books_location.dart';

class BottomNavigationBarWidget extends StatefulWidget {
  BottomNavigationBarWidget({required this.beamerKey});

  final GlobalKey<BeamerState> beamerKey;

  @override
  _BottomNavigationBarWidgetState createState() =>
      _BottomNavigationBarWidgetState();
}

class _BottomNavigationBarWidgetState extends State<BottomNavigationBarWidget> {
  late BeamerDelegate _beamerDelegate;
  int _currentIndex = 0;

  void _setStateListener() => setState(() {});

  @override
  void initState() {
    super.initState();
    _beamerDelegate = widget.beamerKey.currentState!.routerDelegate;
    _beamerDelegate.addListener(_setStateListener);
  }

  @override
  Widget build(BuildContext context) {
    _currentIndex =
        _beamerDelegate.currentBeamLocation is BooksLocation ? 0 : 1;
    return BottomNavigationBar(
      currentIndex: _currentIndex,
      items: [
        BottomNavigationBarItem(label: 'Books', icon: Icon(Icons.book)),
        BottomNavigationBarItem(label: 'Articles', icon: Icon(Icons.article)),
      ],
      onTap: (index) => _beamerDelegate.beamToNamed(
        index == 0 ? '/books' : '/articles',
      ),
    );
  }

  @override
  void dispose() {
    _beamerDelegate.removeListener(_setStateListener);
    super.dispose();
  }
}
