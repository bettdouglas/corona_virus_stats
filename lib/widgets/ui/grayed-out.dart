import 'package:flutter/material.dart';

class GrayedOut extends StatelessWidget {
  final Widget child;
  final bool grayedOut;

  GrayedOut(this.child, {this.grayedOut = true});

  @override
  Widget build(BuildContext context) {
    return grayedOut ? new Opacity(opacity: 0.3, child: child) : child;
  }
}