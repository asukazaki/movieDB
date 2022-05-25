import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../list/MovieList.dart';
import '../list/MovieListViewModel.dart';

class Home extends HookConsumerWidget {
  final _formKey = GlobalKey<FormState>();
  String _message = "";

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
                    if (value == null || value.isEmpty) {
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
      ),
    );
  }
}