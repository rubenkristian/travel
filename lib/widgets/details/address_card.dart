import 'package:flutter/material.dart';
import 'package:travel/widgets/details/detail_container.dart';
import 'package:travel/model/travel_model.dart';

class AddressCard extends StatelessWidget {
  final TravelModel travel;

  const AddressCard({super.key, required this.travel});

  @override
  Widget build(BuildContext context) {
    return DetailContainer(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Address",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          SizedBox(height: 10),
          Text(travel.address),
        ],
      ),
    );
  }
}
