import 'package:flutter/material.dart';
import 'package:store_app/Feuture/views/Cart/widgets/CartScreenBody.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: CartScreenBody(),
    );
  }
}
