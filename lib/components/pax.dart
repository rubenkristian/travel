import 'package:flutter/material.dart';
import 'package:travel/model/travel_model.dart';

class Pax extends StatelessWidget {
  final TravelModel travel;

  const Pax({super.key, required this.travel});

  @override
  Widget build(Object context) {
    return Material(
      child: InkWell(
        onTap: () {},
        child: Padding(
          padding: EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Pax",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              SizedBox(height: 10),
              Text("${travel.pax} peoples"),
            ],
          ),
        ),
      ),
    );
  }
}
