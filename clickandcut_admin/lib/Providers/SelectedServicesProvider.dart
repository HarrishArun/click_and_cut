import 'package:flutter/material.dart';
import 'package:clickandcut_admin/Models/Services.dart';

class SelectedServicesProvider extends ChangeNotifier {
  List<Services> _selectedServices = [];

  List<Services> get selectedServices => _selectedServices;

  void toggleService(Services service) {
    final index = _selectedServices.indexWhere((s) => s.title == service.title);
    if (index != -1) {
      _selectedServices.removeAt(index);
    } else {
      _selectedServices.add(service);
    }
    notifyListeners();
  }
  void removeService(Services service) {
    _selectedServices.removeWhere((s) => s.title == service.title);
    notifyListeners();
  }
}
