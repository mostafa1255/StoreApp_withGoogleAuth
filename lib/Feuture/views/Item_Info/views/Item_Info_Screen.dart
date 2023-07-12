import 'package:flutter/material.dart';
import 'package:store_app/Feuture/views/Item_Info/views/widgets/ItemInfoScreenBody.dart';

class ItemInfoScreen extends StatelessWidget {
  const ItemInfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var device = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.grey,
      body: ItemInfoScreenBody(device: device),
    );
  }
}
