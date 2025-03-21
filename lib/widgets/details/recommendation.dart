import 'package:flutter/material.dart';
import 'package:travel/widgets/details/detail_container.dart';
import 'package:travel/widgets/cards/travel_item.dart';
import 'package:travel/model/travel_model.dart';

class Recommendation extends StatelessWidget {
  final TravelModel travel;

  const Recommendation({super.key, required this.travel});

  @override
  Widget build(Object context) {
    final travelRecommedation = TravelModel.generateFakeTravel(5);
    return DetailContainer(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Recommendation",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
            ],
          ),
          SizedBox(height: 10),
          SizedBox(
            height: 320,
            child: ListView.separated(
              separatorBuilder: (context, index) => SizedBox(width: 10),
              scrollDirection: Axis.horizontal,
              itemCount: travelRecommedation.length,
              itemBuilder: (context, index) {
                final travel = travelRecommedation[index];
                return ConstrainedBox(
                  constraints: BoxConstraints(maxWidth: 240, minWidth: 200),
                  child: TravelItem(
                    travelId: travel.id,
                    image: travel.photo,
                    title: travel.title,
                    price: travel.price,
                    rating: travel.rating,
                    currency: travel.currency,
                    clickable: false,
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
