import 'package:flutter/material.dart';
import 'package:travel/model/travel_model.dart';

class BackgroundDetail extends StatelessWidget {
  final TravelModel travel;

  const BackgroundDetail({super.key, required this.travel});

  @override
  Widget build(BuildContext context) {
    return FlexibleSpaceBar(
      background: Stack(
        fit: StackFit.expand,
        children: [
          Hero(
            tag: "image-${travel.id}",
            child: Image.network(travel.photo, fit: BoxFit.cover),
          ),
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.transparent,
                  Colors.black.withValues(alpha: 0.7),
                ],
              ),
            ),
          ),
        ],
      ),
      title: Text(
        travel.title,
        style: TextStyle(color: Colors.white),
        overflow: TextOverflow.fade,
      ),
      titlePadding: EdgeInsets.only(left: 40, bottom: 13),
      collapseMode: CollapseMode.parallax,
    );
  }
}
