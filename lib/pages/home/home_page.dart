import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Home')),
        body: ListView(children: [
          TextButton(
              onPressed: () =>
                  Beamer.of(context).beamToNamed('/bottom_navigation'),
              child: Text('Go to bottom navigation page'))
        ]));
  }
}
