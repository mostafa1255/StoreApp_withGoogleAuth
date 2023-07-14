import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:store_app/Feuture/data/models/Product_Model.dart';
import 'package:store_app/core/Helpers/Api.dart';

import '../../Product_Cubit/product_cubit.dart';

class allProductservice {
  ProductCubit? productCubit;
  // ignore: non_constant_identifier_names
  Future<List<productModel>> getProducts() async {
    http.Response? response =
        await productCubit?.get(url: "https://fakestoreapi.com/products");

    if (response != null && response.statusCode == 200) {
      List<dynamic> data = jsonDecode(response.body);
      List<productModel> productalist = [];

      for (var i = 0; i < data.length; i++) {
        productalist.add(productModel.fromjcon(data[i]));
      }

      return productalist;
    } else {
      return [];
    }
  }
}
