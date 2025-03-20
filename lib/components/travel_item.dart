import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class TravelItem extends StatelessWidget {
  final int travelId;
  final String image;
  final String title;
  final double price;
  final double rating;
  final String currency;

  const TravelItem({
    super.key,
    required this.travelId,
    required this.image,
    required this.title,
    required this.price,
    required this.rating,
    required this.currency,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      child: InkWell(
        onTap: () {
          context.go("/travel/$travelId");
        },
        borderRadius: BorderRadius.circular(10),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Stack(
            children: [
              Hero(
                tag: "image-$travelId",
                child: Image.network(
                  image,
                  width: double.infinity,
                  height: 360,
                  fit: BoxFit.cover,
                ),
              ),

              Positioned.fill(
                child: Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Colors.black.withValues(alpha: 0.1),
                        Colors.black.withValues(alpha: 0.8),
                      ],
                    ),
                  ),
                ),
              ),

              Positioned(
                bottom: 16,
                left: 16,
                right: 16,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 24,
                      ),
                    ),
                    Row(
                      children: [
                        Text(
                          "${rating.toStringAsFixed(1)}/5",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(width: 5),
                        Icon(
                          Icons.star_rate,
                          size: 16,
                          color: Colors.amberAccent,
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "$currency ${price.toStringAsFixed(2)}",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
