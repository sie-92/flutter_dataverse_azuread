import 'package:flutter/material.dart';

class ListBtnWidget extends StatelessWidget {
  final Function() notifyParent;

  ListBtnWidget({Key? key, required this.notifyParent()}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      key: Key("btn_list"),
      icon: new Icon(Icons.list),
      highlightColor: Colors.blue,
      onPressed: () => notifyParent(),
    );
  }
}
