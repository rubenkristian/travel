import 'package:flutter/material.dart';
import 'package:travel/model/review_model.dart';

class ReviewProvider extends ChangeNotifier {
  List<ReviewModel> _reviewList = [];

  List<ReviewModel> get reviewList => _reviewList;

  void loadReviewList() {
    _reviewList = ReviewModel.generateFakeReview(100);

    notifyListeners();
  }
}
