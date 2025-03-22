import 'package:flutter/material.dart';
import 'package:travel/widgets/cards/chip_detail.dart';
import 'package:travel/widgets/details/detail_container.dart';
import 'package:travel/model/travel_model.dart';

class IncludeExclude extends StatelessWidget {
  final TravelModel travel;

  const IncludeExclude({super.key, required this.travel});

  @override
  Widget build(BuildContext context) {
    return DetailContainer(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Include / Exclude",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          SizedBox(height: 10),
          Wrap(
            spacing: 3,
            runSpacing: 3,
            children:
                travel.include
                    .map(
                      (label) => ChipDetail(
                        label: label,
                        color: Colors.green,
                        icon: Icons.check,
                      ),
                    )
                    .toList() +
                travel.exclude
                    .map(
                      (label) => ChipDetail(
                        label: label,
                        color: Colors.red,
                        icon: Icons.close,
                      ),
                    )
                    .toList(),
          ),
        ],
      ),
    );
  }
}
