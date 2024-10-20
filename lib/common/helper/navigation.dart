import 'package:flutter/material.dart';

extension Navigation on BuildContext {
  void pushReplacement(Widget view) {
    Navigator.pushReplacement(
      this,
      MaterialPageRoute(
        builder: (context) => view,
      ),
    );
  }
}
