import 'package:flutter/material.dart';

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
           customTabBarCategory(),
          customItemListview(
            deviceW: device.width * 0.47,
            deviceH: device.height * 0.37,
          ),
          Row(
            children: [
              Text("Winter Coat"),
              SizedBox(
                width: device.width * 0.2,
              ),
              Text("80\$")
            ],
          )
        ],
      ),
    );
  }
}
