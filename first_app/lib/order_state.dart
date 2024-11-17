import 'package:flutter/material.dart';

class OrderState extends ChangeNotifier {
  List<String> selectedActivities = [];
  double totalPrice = 0.0;

  void addActivity(String activity, double price) {
    selectedActivities.add(activity);
    totalPrice += price;
    notifyListeners(); // Notifie les widgets écoutant cet état
  }

  void removeActivity(int index, double price) {
    selectedActivities.removeAt(index);
    totalPrice -= price;
    notifyListeners();
  }

  void clearOrder() {
    selectedActivities.clear();
    totalPrice = 0.0;
    notifyListeners();
  }
}
