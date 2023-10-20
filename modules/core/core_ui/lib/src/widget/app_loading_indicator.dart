import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppLoadingIndicator extends StatelessWidget {
  const AppLoadingIndicator({
    Key? key,
    this.size = 20,
    this.color,
  }) : super(key: key);

  final double size;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    if (Platform.isIOS) {
      return CupertinoActivityIndicator(
        radius: size * 0.5,
        color: color,
      );
    }

    return SizedBox.square(
      dimension: size,
      child: CircularProgressIndicator(
        strokeWidth: size * 0.1,
        color: color ?? const Color(0xFF2F8BCB),
      ),
    );
  }
}
