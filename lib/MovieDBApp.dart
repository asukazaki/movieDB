import 'dart:developer' as developer;

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:moviedb/main.dart';
import 'package:moviedb/mylist/Mylist.dart';

import 'home/Home.dart';

const primaryColor = Color.fromRGBO(244, 134, 96, 1);
const accentColor = Color.fromRGBO(185, 95, 72, 1);
const backgroundColor = Color.fromRGBO(62, 69, 82, 1);
const secondaryColor = Color.fromRGBO(39, 43, 51, 1);
const textColor = Color.fromRGBO(240, 221, 185, 1);

class MovieDBApp extends StatefulWidget {
  const MovieDBApp({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _MovieDBAppState();
  }}

class _MovieDBAppState extends State<MovieDBApp> {

  static final _screens = [
    Home(),
    Mylist(),
  ];

  int _selectedIndex = 0;

  final keys = [
    GlobalKey<NavigatorState>(),
    GlobalKey<NavigatorState>(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () async {
          final willPop = await Navigator.maybePop(keys[_selectedIndex].currentState!.context);
          developer.log('On Will maybePop $willPop');
          return !willPop;
        },
        child: Scaffold(
            resizeToAvoidBottomInset: false,
            body: Stack(children: [
              Offstage(
                offstage: _selectedIndex != 0,
                child: Navigator(
                  key: keys[0],
                  onGenerateRoute: (routeSettings) {
                    return MaterialPageRoute(builder: (context) {
                      return Home();
                    });
                  },
                ),
              ),
              Offstage(
                offstage: _selectedIndex != 1,
                child: Navigator(
                  key: keys[1],
                  onGenerateRoute: (routeSettings) {
                    return MaterialPageRoute(builder: (context) {
                      return Mylist();
                    });
                  },
                ),
              ),
            ]),
            bottomNavigationBar: Theme(
              data: ThemeData(
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
              ),
              child: BottomNavigationBar(
                currentIndex: _selectedIndex,
                onTap: _onItemTapped,
                items: const <BottomNavigationBarItem>[
                  BottomNavigationBarItem(icon: Icon(Icons.home),backgroundColor: secondaryColor, label: 'Home'),
                  BottomNavigationBarItem(icon: Icon(Icons.favorite),backgroundColor: secondaryColor, label: 'Like')
                ],
                type: BottomNavigationBarType.fixed,
                backgroundColor: secondaryColor,
                unselectedItemColor: Colors.white,
                selectedItemColor: primaryColor,
              ),
            )
        ),
    );
  }
}

class PageWidget extends StatelessWidget {
  final Color color;
  final String title;

  const PageWidget({Key? key, required this.color, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(title),
      ),
      body: Container(
        color: color,
        child: Center(
          child: Text(
            title,
            style: const TextStyle(
              fontSize: 25,
            ),
          ),
        ),
      ),
    );
  }
}