import 'package:flutter/material.dart';
import 'package:travel/model/travel_model.dart';

class TravelProvider extends ChangeNotifier {
  List<TravelModel> _travelList = [];

  List<TravelModel> get travelList => _travelList;

  void loadTravelList() {
    _travelList = TravelModel.generateFakeTravel(5);

    notifyListeners();
  }
}
