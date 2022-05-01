import 'package:flutter/material.dart';

class GridBtnWidget extends StatelessWidget {
  final Function() notifyParent;

  GridBtnWidget({Key? key, required this.notifyParent()}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      key: Key("btn_grid"),
      icon: new Icon(Icons.grid_view_rounded),
      highlightColor: Colors.amber,
      onPressed: () => notifyParent(),
    );
  }
}
