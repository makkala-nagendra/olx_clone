import 'package:flutter/material.dart';

import 'screen_elements.dart';

class AdsScreen extends StatelessWidget {
  const AdsScreen({Key? key}) : super(key: key);

  final int cost = 10000;
  final String itemName = "Item Name";

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 1,
      itemBuilder: (BuildContext context, int index) {
        return InkWell(
          onTap: () {},
          child: AdsList(
            cost: cost,
            itemName: itemName,
          ),
        );
      },
    );
  }
}
