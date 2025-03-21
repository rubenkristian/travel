import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:travel/widgets/cards/travel_item.dart';
import 'package:travel/providers/travel_provider.dart';
import 'package:travel/widgets/search_box.dart';

class ListTravel extends StatefulWidget {
  const ListTravel({super.key});

  @override
  State<StatefulWidget> createState() {
    return ListTravelState();
  }
}

class ListTravelState extends State<ListTravel> {
  @override
  void initState() {
    super.initState();
  }

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
            SizedBox(height: 10),
            SearchBox(hint: "Search trip..."),
          ],
        ),
        toolbarHeight: 100,
        backgroundColor: Colors.lightBlueAccent,
        foregroundColor: Colors.white,
      ),
      body: RefreshIndicator(
        child: Padding(
          padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
          child: Consumer<TravelProvider>(
            builder: (context, travelProvider, child) {
              final travelList = travelProvider.travelList;

              return ListView.separated(
                separatorBuilder: (context, index) => SizedBox(height: 10),
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
          FocusManager.instance.primaryFocus?.unfocus();
          await Future.delayed(Duration(seconds: 2));
          travelProvider.loadTravelList();
        },
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}
