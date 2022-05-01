import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class PreloaderWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      key: Key("loader"),
      child: Lottie.asset('square.json'),
    );
  }
}
