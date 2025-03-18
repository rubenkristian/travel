import 'package:flutter/material.dart';

class ListTravel extends StatefulWidget {
  const ListTravel({super.key});

  @override
  State<StatefulWidget> createState() {
    return ListTravelState();
  }
}

class ListTravelState extends State<ListTravel> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Detail Screen")),
      body: Padding(
        padding: EdgeInsets.all(5),
        child: ListView.builder(
          itemBuilder: (BuildContext context, int key) {
            return Card(child: Row(children: []));
          },
        ),
      ),
    );
  }
}
