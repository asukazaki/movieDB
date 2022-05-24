import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'home/Home.dart';

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
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
            BottomNavigationBarItem(icon: Icon(Icons.favorite), label: 'Like'),
            BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'Settings'),
          ],
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
                return const CupertinoPageScaffold(
                    child: PageWidget(color:Colors.blue, title:'Album')
                );
              });
            case 2:
              return CupertinoTabView(builder: (context) {
                return const CupertinoPageScaffold(
                    child: PageWidget(color:Colors.blue, title:'Album')
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
        title: Text("$title"),
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