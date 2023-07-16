import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:store_app/Feuture/Auth/views/Login_Screen.dart';
import 'package:store_app/Feuture/Product_Cubit/product_cubit.dart';
import 'package:store_app/Feuture/views/Cart/cart_screen.dart';
import 'package:store_app/Feuture/views/Home/views/widgets/HomeScreenbody.dart';
import 'package:store_app/core/constant.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                Get.to(CartScreen(
                  countitem:
                      BlocProvider.of<ProductCubit>(context).GetCountItemCart(),
                  index: 0,
                ));
              },
              icon: FaIcon(
                FontAwesomeIcons.cartShopping,
                color:
                    BlocProvider.of<ProductCubit>(context).GetCountItemCart() ==
                            0
                        ? Colors.black
                        : Colors.green,
              ))
        ],
        backgroundColor: Colors.white,
        elevation: 0,
        leading: Builder(
          builder: (context) => InkWell(
            onTap: () {
              Scaffold.of(context).openDrawer();
            },
            child: const Icon(
              Icons.menu,
              color: Colors.black,
              size: 30.0,
            ),
          ),
        ),
      ),
      drawer: Drawer(
          backgroundColor: Colors.white,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const UserAccountsDrawerHeader(
                  accountName: Text("Mostafa"),
                  accountEmail: Text("Mostafa@gmail.com")),
              IconButton(
                  onPressed: () {
                    constant.userid = null;
                    Get.to(LoginScreen());
                  },
                  icon: const Icon(Icons.logout))
            ],
          )),
      body: const HomeScreenbody(),
    );
  }
}
