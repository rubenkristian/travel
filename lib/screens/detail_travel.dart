import 'package:flutter/material.dart';

class DetailTravel extends StatefulWidget {
  const DetailTravel({super.key});

  @override
  State<StatefulWidget> createState() {
    return DetailTravelState();
  }
}

class DetailTravelState extends State<DetailTravel> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Detail Screen")),
      body: SingleChildScrollView(child: Column(children: [])),
    );
  }
}
