import 'package:flutter/material.dart';

class SearchWidget extends StatelessWidget {
  final Function(String) notifyParent;
  String curText = "";

  SearchWidget({Key? key, required this.notifyParent(String str)})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      key: Key('search_bar'),
      padding: EdgeInsets.all(12.0),
      child: TextField(
        autofocus: false,

        onSubmitted: (searchText) => notifyParent(searchText),
        onChanged: (searchText) => {curText = searchText},
        // controller: _textController,
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          suffixIcon: IconButton(
            icon: new Icon(Icons.search),
            onPressed: () => notifyParent(curText),
          ),
          hintText: 'Search Accounts',
        ),
      ),
    );
  }
}
