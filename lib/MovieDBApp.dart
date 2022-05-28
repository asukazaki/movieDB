import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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

  @override
  Widget build(BuildContext context) {
    return CupertinoTabScaffold(
        tabBar: CupertinoTabBar(
          activeColor: Colors.white,
          inactiveColor: backgroundColor,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(icon: Icon(Icons.home),backgroundColor: secondaryColor, label: 'Home'),
            BottomNavigationBarItem(icon: Icon(Icons.favorite),backgroundColor: secondaryColor, label: 'Like')
          ],
          backgroundColor: secondaryColor,
        ),
        tabBuilder: (context, index) {
          switch (index) {
            case 0:
              return CupertinoTabView(builder: (context) {
                return CupertinoPageScaffold(
                    child: Home()
                );
              });
            case 1:
              return CupertinoTabView(builder: (context) {
                return CupertinoPageScaffold(
                    child: Mylist()
                );
              });
            default:
              return const PageWidget(color:Colors.blue, title:'Album');
          }
        });
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