import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'screen1.dart';
import 'screen2.dart';
import 'screen3.dart';
import 'screen4.dart';
import 'tab_model.dart';

void main() => runApp(
      ChangeNotifierProvider(
        create: (_) => TabModel(),
        child: const BottomNavLabApp(),
      ),
    );

class BottomNavLabApp extends StatelessWidget {
  const BottomNavLabApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BottomNavLab(),
    );
  }
}

class BottomNavLab extends StatelessWidget {
  const BottomNavLab({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bottom Navigation Bar'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: const _TabBody(),
      bottomNavigationBar: const _TabNavBar(),
    );
  }
}

class _TabBody extends StatelessWidget {
  const _TabBody();

  static const List<Widget> screens = [
    Screen1(),
    Screen2(),
    Screen3(),
    Screen4(),
  ];

  @override
  Widget build(BuildContext context) {
    final int currentIndex = context.watch<TabModel>().currentIndex;
    return screens[currentIndex];
  }
}

class _TabNavBar extends StatelessWidget {
  const _TabNavBar();

  @override
  Widget build(BuildContext context) {
    final int currentIndex = context.watch<TabModel>().currentIndex;
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      fixedColor: Colors.white,
      backgroundColor: Colors.blue,
      iconSize: 30.0,
      currentIndex: currentIndex,
      onTap: (int index) => context.read<TabModel>().select(index),
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
        BottomNavigationBarItem(icon: Icon(Icons.alarm), label: 'Alarm'),
        BottomNavigationBarItem(
          icon: Icon(Icons.business),
          label: 'Business',
        ),
        BottomNavigationBarItem(icon: Icon(Icons.school), label: 'School'),
      ],
    );
  }
}
