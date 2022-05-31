import 'package:flutter/material.dart';

class HiddenDrawerProvider with ChangeNotifier {
  double _xOffset = 0;
  double _yOffset = 0;
  double _scaleFactor = 1.0;
  bool _isDrawerOpen = false;
  bool _isDragging = false;

  double get xOffset => _xOffset;
  double get yOffset => _yOffset;
  double get scaleFactor => _scaleFactor;
  bool get isDrawerOpen => _isDrawerOpen;
  bool get isDragging => _isDragging;

  void openDrawer() {
    _xOffset = 230;
    _yOffset = 150;
    _scaleFactor = 0.6;
    _isDrawerOpen = true;
    notifyListeners();
  }

  void closeDrawer() {
    _xOffset = 0;
    _yOffset = 0;
    _scaleFactor = 1;
    _isDrawerOpen = false;
    notifyListeners();
  }

  void setIsDragging(bool dragging) {
    _isDragging = dragging;
    notifyListeners();
  }
}
