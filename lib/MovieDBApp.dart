import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'home/Home.dart';
import 'list/MovieList.dart';
import 'list/MovieListViewModel.dart';

class MovieDBApp extends StatefulWidget {
  const MovieDBApp({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _MovieDBAppState();
  }}

class _MovieDBAppState extends State<MovieDBApp> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    final bottomNavigationBar = BottomNavigationBar(
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
        BottomNavigationBarItem(icon: Icon(Icons.favorite), label: 'Like'),
        BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'Settings'),
      ],
      currentIndex: _currentIndex,
      fixedColor: Colors.blueAccent,
      onTap: (int index){
        setState(() => _currentIndex = index );
      },
      type: BottomNavigationBarType.fixed,
    );
    if (_currentIndex == 0) {
      return Home(bottomNavigationBar);
    } else if (_currentIndex == 1) {
      return PageWidget(color:Colors.blue, title:'Album', bottomNavigationBar: bottomNavigationBar);
    } else {
      return PageWidget(color:Colors.orange, title:'Chat', bottomNavigationBar: bottomNavigationBar);
    }

    // return Scaffold(
    //   body: _pageWidgets.elementAt(_currentIndex),
    //   bottomNavigationBar: BottomNavigationBar(
    //     items: const <BottomNavigationBarItem>[
    //       BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
    //       BottomNavigationBarItem(icon: Icon(Icons.favorite), label: 'Likes'),
    //       BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'Settings'),
    //     ],
    //     currentIndex: _currentIndex,
    //     fixedColor: Colors.blueAccent,
    //     onTap: _onItemTapped,
    //     type: BottomNavigationBarType.fixed,
    //   ),
    // );
  }
}

class PageWidget extends StatelessWidget {
  final Color color;
  final String title;
  final BottomNavigationBar bottomNavigationBar;

  const PageWidget({Key? key, required this.color, required this.title, required this.bottomNavigationBar}) : super(key: key);

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
      bottomNavigationBar: bottomNavigationBar,
    );
  }
}