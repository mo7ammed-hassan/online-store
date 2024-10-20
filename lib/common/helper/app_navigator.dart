import 'package:flutter/material.dart';

extension AppNavigator on BuildContext {
  void pushReplacement(Widget view) {
    Navigator.pushReplacement(
      this,
      MaterialPageRoute(
        builder: (context) => view,
      ),
    );
  }

  void push(Widget view) {
    Navigator.push(
      this,
      MaterialPageRoute(
        builder: (context) => view,
      ),
    );
  }

  void pop() {
    Navigator.pop(
      this,
    );
  }
}
