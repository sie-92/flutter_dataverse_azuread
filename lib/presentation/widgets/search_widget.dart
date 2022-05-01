import 'package:flutter/material.dart';

class SearchWidget extends StatelessWidget {
  final Function(String) notifyParent;

  SearchWidget({Key? key, required this.notifyParent(String str) })
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      key: Key('search_bar'),
      padding: EdgeInsets.all(12.0),
      child: TextField(
        autofocus: false,
        onChanged: (searchText) => notifyParent(searchText),
        // controller: _textController,
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          prefixIcon: Icon(Icons.search),
          hintText: 'Search Accounts',
        ),
      ),
    );
  }
}