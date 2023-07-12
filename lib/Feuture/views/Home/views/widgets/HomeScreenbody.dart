import 'package:flutter/material.dart';
import 'package:store_app/core/constant.dart';

import 'bottomListViewwithSearch.dart';
import 'customItemListview.dart';
import 'customTabBarCategory.dart';

class HomeScreenbody extends StatelessWidget {
  const HomeScreenbody({super.key});

  @override
  Widget build(BuildContext context) {
    var device = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const customTabBarCategory(),
          customItemListview(
            deviceW: device.width * 0.47,
            deviceH: device.height * 0.37,
            device: device,
            enfo: true,
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: Text(
              "Recommended for You",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          bottomListViewwithSearch(device: device)
        ],
      ),
    );
  }
}
