import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:travel/widgets/details/address_card.dart';
import 'package:travel/widgets/background_detail.dart';
import 'package:travel/widgets/bottom_detail.dart';
import 'package:travel/widgets/details/include_exclude.dart';
import 'package:travel/widgets/details/pax.dart';
import 'package:travel/widgets/details/rating_review.dart';
import 'package:travel/widgets/details/recommendation.dart';
import 'package:travel/widgets/details/summary.dart';
import 'package:travel/widgets/details/term_condition.dart';
import 'package:travel/providers/travel_provider.dart';

class DetailTravel extends StatelessWidget {
  final String travelId;
  const DetailTravel({super.key, required this.travelId});

  @override
  Widget build(BuildContext context) {
    final travelProvider = Provider.of<TravelProvider>(context);
    final travel = travelProvider.travelList.firstWhere((travel) {
      return travel.id == travelId;
    });

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
                  flexibleSpace: BackgroundDetail(travel: travel),
                  elevation: 2,
                  backgroundColor: Colors.lightBlueAccent,
                  foregroundColor: Colors.white,
                  leading: IconButton(
                    onPressed: () => context.pop(),
                    icon: Icon(Icons.arrow_back_ios, color: Colors.white),
                  ),
                  actions: [
                    IconButton(onPressed: () {}, icon: Icon(Icons.bookmark)),
                  ],
                ),
                SliverPadding(
                  padding: EdgeInsets.fromLTRB(20, 10, 20, 100),
                  sliver: SliverList.list(
                    children: [
                      AddressCard(travel: travel),
                      SizedBox(height: 10),
                      Summary(travel: travel),
                      SizedBox(height: 10),
                      RatingReview(travel: travel),
                      SizedBox(height: 10),
                      IncludeExclude(travel: travel),
                      SizedBox(height: 10),
                      TermCondition(travel: travel),
                      SizedBox(height: 10),
                      Pax(travel: travel),
                      SizedBox(height: 10),
                      Recommendation(travel: travel),
                    ],
                  ),
                ),
              ],
            ),
          ),
          BottomDetail(travel: travel),
        ],
      ),
    );
  }
}
