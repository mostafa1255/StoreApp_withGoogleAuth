import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:store_app/Feuture/data/models/Product_Model.dart';
import 'package:store_app/core/Helpers/Api.dart';
import '../../Product_Cubit/product_cubit.dart';

class AllProductByCategory {
  ProductCubit? productCubit;
  Future<List<productModel>> getProductbyCategory(
      {required String categoryName}) async {
    http.Response? response = await Api()
        .get(url: "https://fakestoreapi.com/products/category/$categoryName");

    if (response.statusCode == 200) {
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
