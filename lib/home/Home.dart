import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:moviedb/MovieDBApp.dart';
import '../service/Text+Extension.dart';

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
        title: TextX.textX("home")
      ),
      body: Container(
        color: backgroundColor,
        child: Center(
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
                    // decoration: const InputDecoration(labelText: '検索', labelStyle: TextStyle(color: textColor)),
                    style: TextStyle(color: Colors.white),
                    decoration: const InputDecoration(
                      labelText: '検索',
                      labelStyle: TextStyle(color: textColor),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: textColor),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: textColor),
                      ),
                    ),
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
                      child: TextX.textX("検索"),
                      onPressed: () async {
                        if (_formKey.currentState!.validate()) {
                          // バリデーションチェック後
                          _formKey.currentState!.save();

                          ref.watch(movieListViewModelProvider).setSearchWord(_message);
                          ref.read(movieListViewModelProvider).fetchMovies(shouldReset: true);
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
      )
    );
  }
}