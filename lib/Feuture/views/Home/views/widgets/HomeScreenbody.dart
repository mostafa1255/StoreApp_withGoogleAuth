import 'package:flutter/material.dart';
import 'package:store_app/Feuture/data/services/AllProduct.dart';
import 'bottomListViewwithSearch.dart';
import 'customItemListview.dart';
import 'customTabBarCategory.dart';

class HomeScreenbody extends StatelessWidget {
  const HomeScreenbody({super.key});

  @override
  Widget build(BuildContext context) {
    allProductservice product = allProductservice();
    product.getProducts();
    var device = MediaQuery.of(context).size;
    return Padding(
      padding:
          EdgeInsets.symmetric(horizontal: device.width * 0.02, vertical: 0),
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
          Padding(
            padding: EdgeInsets.symmetric(horizontal: device.width * 0.03),
            child: const Text(
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
