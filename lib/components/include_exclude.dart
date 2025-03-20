import 'package:flutter/material.dart';
import 'package:travel/model/travel_model.dart';

class IncludeExclude extends StatelessWidget {
  final TravelModel travel;

  const IncludeExclude({super.key, required this.travel});

  @override
  Widget build(BuildContext context) {
    return Material(
      child: InkWell(
        onTap: () {},
        child: Padding(
          padding: EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Icon(Icons.check_circle, size: 14),
                  SizedBox(width: 5),
                  Text(
                    "Include",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                ],
              ),
              SizedBox(height: 10),
              Padding(
                padding: EdgeInsets.only(left: 20),
                child: RichText(
                  text: TextSpan(
                    style: TextStyle(fontSize: 16, color: Colors.black),
                    children:
                        travel.include.map((item) {
                          return TextSpan(text: "- $item\n");
                        }).toList(),
                  ),
                ),
              ),
              Row(
                children: [
                  Icon(Icons.remove_circle, size: 14),
                  SizedBox(width: 5),
                  Text(
                    "Exclude",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                ],
              ),
              SizedBox(height: 10),
              Padding(
                padding: EdgeInsets.only(left: 20),
                child: RichText(
                  text: TextSpan(
                    style: TextStyle(fontSize: 16, color: Colors.black),
                    children:
                        travel.exclude.map((item) {
                          return TextSpan(text: "- $item\n");
                        }).toList(),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
