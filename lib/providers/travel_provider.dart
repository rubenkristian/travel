import 'package:flutter/material.dart';
import 'package:travel/model/travel_model.dart';

class TravelProvider extends ChangeNotifier {
  List<TravelModel> _travelList = [];
  List<TravelModel> _searchTravelList = [];
  bool _isLoading = true;
  bool _isSearch = false;
  String _searchInput = "";

  List<TravelModel> get travelList => _travelList;
  List<TravelModel> get searchTravelList => _searchTravelList;
  bool get isLoading => _isLoading;
  bool get isSearch => _isSearch;
  String get searchInput => _searchInput;

  void loadTravelList() {
    _isLoading = false;
    _travelList = TravelModel.generateFakeTravel(5);

    notifyListeners();
  }

  void refresh() {
    _isLoading = true;
    _isSearch = false;

    notifyListeners();
    Future.delayed(Duration(seconds: 2), () {
      loadTravelList();
    });
  }

  void search(String input) {
    _searchInput = input;
    _isLoading = true;

    notifyListeners();

    Future.delayed(Duration(seconds: 2), () {
      _isLoading = false;
      _isSearch = true;
      _searchTravelList =
          _travelList.where((travel) {
            return travel.title.toLowerCase().contains(input);
          }).toList();

      notifyListeners();
    });
  }

  void searchRefresh() {
    _isLoading = true;
    notifyListeners();
    Future.delayed(Duration(seconds: 2), () {
      _isLoading = false;
      _isSearch = true;
      _searchTravelList =
          _travelList.where((travel) {
            return travel.title.toLowerCase().contains(_searchInput);
          }).toList();
      notifyListeners();
    });
  }
}
