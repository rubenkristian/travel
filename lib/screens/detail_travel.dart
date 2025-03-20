import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:travel/components/include_exclude.dart';
import 'package:travel/components/pax.dart';
import 'package:travel/components/rating_review.dart';
import 'package:travel/components/summary.dart';
import 'package:travel/components/term_condition.dart';
import 'package:travel/providers/travel_provider.dart';

class DetailTravel extends StatelessWidget {
  final int travelId;
  const DetailTravel({super.key, required this.travelId});

  @override
  Widget build(BuildContext context) {
    final travelProvider = Provider.of<TravelProvider>(context);
    final travel = travelProvider.travelList[travelId - 1];

    return Scaffold(
      body: Stack(
        children: [
          Container(
            color: Colors.grey[200],
            child: CustomScrollView(
              slivers: [
                SliverAppBar(
                  expandedHeight: 320.0,
                  floating: false,
                  pinned: true,
                  flexibleSpace: FlexibleSpaceBar(
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
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    titlePadding: EdgeInsets.only(left: 40, bottom: 13),
                    collapseMode: CollapseMode.pin,
                  ),
                  elevation: 2,
                  backgroundColor: Colors.lightBlueAccent,
                  foregroundColor: Colors.white,
                  leading: IconButton(
                    onPressed: () => context.pop(),
                    icon: Icon(Icons.arrow_back_ios, color: Colors.white),
                  ),
                ),
                SliverPadding(
                  padding: EdgeInsets.fromLTRB(0, 0, 0, 180),
                  sliver: SliverList.list(
                    children: [
                      Summary(travel: travel),
                      SizedBox(height: 10),
                      RatingReview(travel: travel),
                      SizedBox(height: 10),
                      IncludeExclude(travel: travel),
                      SizedBox(height: 10),
                      TermCondition(travel: travel),
                      SizedBox(height: 10),
                      Pax(travel: travel),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              padding: EdgeInsets.fromLTRB(24, 12, 24, 12),
              height: 80,
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.1),
                    blurRadius: 4,
                    spreadRadius: 1,
                    offset: Offset(0, -2),
                  ),
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "${travel.currency} ${travel.price.toStringAsFixed(2)}",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(0, 5, 0, 5),
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.lightBlueAccent,
                        padding: EdgeInsets.symmetric(
                          vertical: 2,
                          horizontal: 16,
                        ),
                        textStyle: TextStyle(fontSize: 16, color: Colors.white),
                      ),
                      child: Center(
                        child: Text(
                          "Book Now",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
