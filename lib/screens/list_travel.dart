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
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Explore Trips",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Container(
              height: 40,
              padding: EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(
                color: Colors.white.withValues(alpha: 0.2),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Center(
                child: TextField(
                  decoration: InputDecoration(
                    hintText: "Search trips...",
                    hintStyle: TextStyle(color: Colors.white70, fontSize: 18),
                    border: InputBorder.none,
                    icon: Icon(Icons.search, color: Colors.white70),
                  ),
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ],
        ),
        toolbarHeight: 100,
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
