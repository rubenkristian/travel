import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:travel/components/travel_item.dart';
import 'package:travel/providers/travel_provider.dart';

class ListTravel extends StatelessWidget {
  const ListTravel({super.key});

  @override
  Widget build(BuildContext context) {
    final travelProvider = Provider.of<TravelProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Trip Explorer",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.lightBlueAccent,
        foregroundColor: Colors.white,
      ),
      body: RefreshIndicator(
        child: Padding(
          padding: EdgeInsets.all(5),
          child: Consumer<TravelProvider>(
            builder: (context, travelProvider, child) {
              final travelList = travelProvider.travelList;

              return ListView.builder(
                itemCount: travelList.length,
                itemBuilder: (BuildContext context, int key) {
                  var travel = travelList[key];
                  return TravelItem(
                    travelId: travel.id,
                    image: travel.photo,
                    title: travel.title,
                    price: travel.price,
                    rating: travel.rating,
                    currency: travel.currency,
                  );
                },
              );
            },
          ),
        ),
        onRefresh: () async {
          await Future.delayed(Duration(seconds: 2));
          travelProvider.loadTravelList();
        },
      ),
    );
  }
}
