import 'package:flutter/material.dart';
import 'package:travel/components/review_card.dart';
import 'package:travel/model/travel_model.dart';

class RatingReview extends StatelessWidget {
  final TravelModel travel;

  const RatingReview({super.key, required this.travel});

  @override
  Widget build(Object context) {
    return Material(
      child: InkWell(
        onTap: () {},
        child: Padding(
          padding: EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Rating/Review",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                ],
              ),
              SizedBox(height: 10),
              Row(
                children: [
                  Text(
                    "${travel.rating.toStringAsFixed(1)}/5",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  SizedBox(width: 5),
                  Icon(Icons.star_rate, size: 14, color: Colors.amberAccent),
                ],
              ),
              SizedBox(height: 10),
              SizedBox(
                height: 180,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: travel.tripReviews.length,
                  itemBuilder: (context, index) {
                    return ConstrainedBox(
                      constraints: BoxConstraints(maxWidth: 240, minWidth: 200),
                      child: ReviewCard(review: travel.tripReviews[index]),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
