import 'package:flutter/material.dart';
import '../core/services/storage_service.dart';

class CounterViewModel extends ChangeNotifier {
  int _counter = 0;
  final StorageService _storageService = StorageService();

  int get counter => _counter;

  CounterViewModel() {
    _loadCounter();
  }

  Future<void> _loadCounter() async {
    _counter = await _storageService.loadCounter();
    notifyListeners();
  }

  Future<void> incrementCounter() async {
    _counter++;
    await _storageService.saveCounter(_counter);
    notifyListeners();
  }
}
