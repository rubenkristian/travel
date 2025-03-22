import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';
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
  String? search;
  final TextEditingController _controller = TextEditingController();
  Timer? _debounce;

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
            SearchBox(
              hint: "Search trip...",
              onSearch: (input) {
                if (_debounce?.isActive ?? false) _debounce?.cancel();

                _debounce = Timer(Duration(milliseconds: 500), () {
                  travelProvider.search(input);
                });
              },
              controller: _controller,
            ),
          ],
        ),
        toolbarHeight: 100,
        backgroundColor: Colors.lightBlueAccent,
        foregroundColor: Colors.white,
      ),
      body: RefreshIndicator(
        child: Padding(
          padding: EdgeInsets.all(10),
          child: Consumer<TravelProvider>(
            builder: (context, travelProvider, child) {
              final travelList = travelProvider.travelList;
              final searchTravelList = travelProvider.searchTravelList;
              final isLoading = travelProvider.isLoading;
              final isSearch = travelProvider.isSearch;

              if (isLoading) {
                return Shimmer.fromColors(
                  baseColor: Colors.grey.shade300,
                  highlightColor: Colors.grey.shade100,
                  enabled: true,
                  child: ListView.separated(
                    itemBuilder: (BuildContext context, int key) {
                      return Card(child: SizedBox(height: 320));
                    },
                    separatorBuilder: (context, index) => SizedBox(height: 10),
                    itemCount: 5,
                  ),
                );
              }

              if (isSearch && searchTravelList.isEmpty) {
                return Center(
                  child: Text(
                    "No trip found with input ${travelProvider.searchInput}",
                  ),
                );
              }

              return ListView.separated(
                separatorBuilder: (context, index) => SizedBox(height: 10),
                itemCount:
                    isSearch ? searchTravelList.length : travelList.length,
                itemBuilder: (BuildContext context, int key) {
                  var travel =
                      isSearch ? searchTravelList[key] : travelList[key];
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
          if (!travelProvider.isSearch) {
            travelProvider.refresh();
            return;
          }
          travelProvider.searchRefresh();
        },
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}
