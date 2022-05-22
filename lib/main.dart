import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:moviedb/list/MovieListViewModel.dart';

import 'list/MovieList.dart';

void main() async {
  await initializeDateFormatting('ja_JP');
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePageState(),
    );
  }
}

// class MyHomePage extends StatefulWidget {
//   const MyHomePage({Key? key, required this.title}) : super(key: key);
//   final String title;
//
//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }

class MyHomePageState extends HookConsumerWidget {
  final _formKey = GlobalKey<FormState>();

  String _message = "";

  MyHomePageState({Key? key}) : super(key: key);

  void _onTapSearch(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => MovieList()),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: const Text("title"),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Form(
          key: _formKey,
          child: Container(
            padding: const EdgeInsets.all(24),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextFormField(
                  decoration: const InputDecoration(labelText: '検索'),
                  validator: (value) {
                    if (value == null) {
                      return "入力必須です。";
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _message = value!;
                  },
                ),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    child: const Text('送信'),
                    onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                        // バリデーションチェック後
                        _formKey.currentState!.save();

                        ref.watch(movieListViewModelProvider).setSearchWord(_message);
                        ref.read(movieListViewModelProvider).fetchMovies();
                        _onTapSearch(context);
                      }
                    },
                  ),
                )
              ],
            ),
          ),
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
